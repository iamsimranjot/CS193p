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
class EmojiMemoryGame {
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    private static let availableEmojis = ["👻", "🎃", "🕷", "🧛🏻", "🧟‍♂️", "🥶", "💩", "🌚", "🍆", "🍭", "🎈", "⚽️"]
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = availableEmojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
