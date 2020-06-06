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
    private(set) var primaryColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true).padding(5).opacity(0.4)
                Text(card.content)
            }
            else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(LinearGradient(gradient: Gradient(colors: [primaryColor.opacity(0.9),
                                                                         primaryColor.opacity(0.95), primaryColor]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                }
            }
        }
            .foregroundColor(primaryColor)
            .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: Drawing Constants
    
    private let cornerRadius: CGFloat =  10.0
    private let edgeLineWidth: CGFloat = 3
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        viewModel.choose(card: viewModel.cards[0])
        return CardView(card: viewModel.cards[0],
                        primaryColor: viewModel.theme.primaryColor)
    }
}
