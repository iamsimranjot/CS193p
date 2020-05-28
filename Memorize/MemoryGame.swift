//
//  MemoryGame.swift
//  Memorize
//
//  Created by SimranJot Singh on 21/05/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id { return index }
        }
        return 0 // TODO: bogus!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }        
        cards.shuffle()
    }
    
    
    /// When we use List or ForEach to make dynamic views,
    /// SwiftUI needs to know how it can identify each item uniquely otherwise it’s not able to compare view hierarchies to figure out what has changed.
    /// Confirming to Identifiable protocol makes it comparable
    struct Card: Identifiable {
        var isFaceUp: Bool =  true
        var isMatched: Bool =  false
        var content: CardContent
        var id: Int
    }
}
