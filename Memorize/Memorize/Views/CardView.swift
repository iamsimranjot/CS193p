//
//  CardView.swift
//  Memorize
//
//  Created by SimranJot Singh on 04/06/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import SwiftUI

struct CardView: View {
    private(set) var card: MemoryGame<String>.Card
    private(set) var fillColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(pieStartAngle),
                    endAngle: Angle.degrees(pieEndAngle))
                        .padding(pieViewPadding)
                        .opacity(pieViewOpacity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? contentMaxRotationAngle : contentMinRotationAngle))
                    .animation(card.isMatched ? Animation.linear(duration: rotationDuration).repeatForever(autoreverses: false) : .default)
            }
                .cardify(faceup: card.isFaceUp, fillColor: fillColor)
                .transition(.scale)
        }
    }
    
    // MARK: Drawing Constant
    
    private let pieViewPadding: CGFloat = 5
    private let pieViewOpacity: Double = 0.4
    private let pieStartAngle: Double = 0-90
    private let pieEndAngle: Double = 110-90
    
    private let rotationDuration: Double = 1
    private let contentMinRotationAngle: Double = 0
    private let contentMaxRotationAngle: Double = 360
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        viewModel.choose(card: viewModel.cards[0])
        return CardView(card: viewModel.cards[0],
                        fillColor: viewModel.theme.fillColor)
    }
}
