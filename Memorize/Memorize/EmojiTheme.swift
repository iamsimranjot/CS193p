//
//  EmojiTheme.swift
//  Memorize
//
//  Created by SimranJot Singh on 04/06/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import SwiftUI

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
                              availableEmojis: ["👻", "🎃", "🕷", "🧛🏻", "🧟‍♂️", "🥶", "💩", "🌚", "🍆", "🍭", "🎈", "⚽️"],
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
                              primaryColor: .black)
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

struct EmojiTheme {
    let name: String
    let availableEmojis: [String]
    var numberOfPairs: Int
    let primaryColor: Color
    let secondaryColor: Color
    
    init(name: String,
         availableEmojis: [String],
         numberOfPairs: Int? = nil,
         primaryColor: Color,
         secondaryColor: Color = .white) {
        
        self.name = name
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.availableEmojis = availableEmojis
        self.numberOfPairs = numberOfPairs ?? Int.random(in: 2...availableEmojis.count)
    }
}


