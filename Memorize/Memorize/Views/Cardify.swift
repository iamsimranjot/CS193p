//
//  Cardify.swift
//  Memorize
//
//  Created by SimranJot Singh on 06/06/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    private(set) var fillColor: Color
    private var rotation: Double
    
    private var isFaceUp: Bool {
        rotation < 90
    }
    
    init(_ isFaceUp: Bool, fillColor: Color) {
        rotation = (isFaceUp ? 0 : 180)
        self.fillColor = fillColor
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                    .fill(fillColor)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(LinearGradient(gradient: Gradient(colors: [fillColor.opacity(0.9),
                                                                 fillColor.opacity(0.95),
                                                                 fillColor]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    // MARK: Drawing Constants
    
    private let cornerRadius: CGFloat =  10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {    
    func cardify(faceup isFaceup: Bool, fillColor: Color) -> some View {
        self.modifier(Cardify(isFaceup, fillColor: fillColor))
    }
}
