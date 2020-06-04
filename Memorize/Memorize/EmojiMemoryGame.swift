//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by SimranJot Singh on 21/05/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import Foundation
import SwiftUI

/// View-model does not talks to the views, the views talk to the view-model.
/// There can be n number of views that can talk to the view-model. Think of it like a doorway or a portal to the model which is private to the views.
/// That is why it is made a class so that multiple views can share the portal (view-model)
///
/// ObservableObject only works with classes
class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    var theme: EmojiTheme
    
    init() {
        theme = EmojiMemoryGame.loadNewTheme()
        model = EmojiMemoryGame.createMemoryGame(for: theme)
    }
        
    static func createMemoryGame(for theme: EmojiTheme) -> MemoryGame<String> {
        
        let emojis = theme.availableEmojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    static func loadNewTheme() -> EmojiTheme {
        return Themes.allCases.map {$0.content()}.shuffled().first!
    }    
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.loadNewTheme()
        model = EmojiMemoryGame.createMemoryGame(for: theme)
    }
}
