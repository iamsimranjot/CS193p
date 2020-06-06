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
                Pie(startAngle: Angle.degrees(0-90),
                    endAngle: Angle.degrees(110-90))
                        .padding(5)
                        .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
                .cardify(faceup: card.isFaceUp, fillColor: fillColor)
        }
    }
    
    // MARK: Drawing Constant
    
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
