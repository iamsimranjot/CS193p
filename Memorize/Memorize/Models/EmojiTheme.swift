//
//  EmojiTheme.swift
//  Memorize
//
//  Created by SimranJot Singh on 04/06/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import SwiftUI

struct EmojiTheme {    
    let name: String
    let availableEmojis: [String]
    let numberOfPairs: Int
    let fillColor: Color
    let secondaryColor: Color
    
    init(name: String,
         availableEmojis: [String],
         numberOfPairs: Int? = nil,
         primaryColor: Color,
         secondaryColor: Color = .white) {
        
        self.name = name
        self.fillColor = primaryColor
        self.secondaryColor = secondaryColor
        self.availableEmojis = availableEmojis
        self.numberOfPairs = numberOfPairs ?? Int.random(in: 5...availableEmojis.count)
    }
}

enum Themes: CaseIterable {
    case halloween
    case flags
    case sports
    case vehicles
    case animals
    case faces
}

extension Themes {
    func content() -> EmojiTheme {
        switch self {
        case .halloween:
            return EmojiTheme(name: "Halloween",
                              availableEmojis: ["👻", "🎃", "🕷", "🧛🏻", "🧟‍♂️", "🕸", "🦸‍♂️", "🧙", "🧝‍♂️", "🧜‍♂️", "🧚‍♂️", "🧞‍♂️"],
                              numberOfPairs: 6,
                              primaryColor: .orange)
        case .flags:
            return EmojiTheme(name: "Flags",
                              availableEmojis: ["🇦🇷", "🇦🇺", "🇨🇦", "🇿🇦", "🇮🇳", "🇩🇰", "🇪🇺", "🏳️‍🌈", "🇺🇸"],
                              primaryColor: .green)
        case .sports:
            return EmojiTheme(name: "Sports",
                              availableEmojis:["⚽️", "🏀", "🏈", "⚾️", "🎱", "🏏", "🏸", "⛷"],
                              primaryColor: .red)
        case .vehicles:
            return EmojiTheme(name: "Vehicles",
                              availableEmojis:["🚗", "🚌", "🏎", "🚑", "🚲", "🛵", "✈️", "🚢"],
                              primaryColor: .accentColor)
        case .animals:
            return EmojiTheme(name: "Animals",
                              availableEmojis:["🐶", "🐼", "🐮", "🐷", "🐵", "🐔", "🦄", "🐙"],
                              primaryColor: .gray)
        case .faces:
            return EmojiTheme(name: "Faces",
                              availableEmojis:["🙃", "😇", "😱", "🤩", "🥳", "🥶", "🤯", "🤬"],
                              primaryColor: .pink)
        }
    }
}


