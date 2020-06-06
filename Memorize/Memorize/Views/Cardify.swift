//
//  Cardify.swift
//  Memorize
//
//  Created by SimranJot Singh on 06/06/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    private(set) var isFaceUp: Bool
    private(set) var fillColor: Color
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth).fill(fillColor)
                content
            }
            else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(LinearGradient(gradient: Gradient(colors: [fillColor.opacity(0.9),
                                                                     fillColor.opacity(0.95),
                                                                     fillColor]),
                                         startPoint: .top,
                                         endPoint: .bottom))
            }
        }
    }
    
    // MARK: Drawing Constants
    
    private let cornerRadius: CGFloat =  10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {    
    func cardify(faceup isFaceup: Bool, fillColor: Color) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceup, fillColor: fillColor))
    }
}
