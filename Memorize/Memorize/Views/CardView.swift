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
        min(size.width, size.height) * 0.75
    }
}
