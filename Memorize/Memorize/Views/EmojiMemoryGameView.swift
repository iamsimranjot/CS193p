//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by SimranJot Singh on 20/05/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.theme.name).font(.largeTitle)
                Spacer(minLength: spacerMinLength)
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.viewModel.newGame()
                    }
                }) {
                    Text(newGameLabel)
                        .padding(newGameButtonPadding)
                        .foregroundColor(.white)
                        .background(viewModel.theme.fillColor)
                        .cornerRadius(newGameButtonCornerRadius)
                        .font(.subheadline)
                }
            }
            Grid(viewModel.cards) { card in
                CardView(card: card, fillColor: self.viewModel.theme.fillColor).onTapGesture {
                    withAnimation(.linear(duration: self.cardFlipDuration)) {
                        self.viewModel.choose(card: card)
                    }
                }
                    .padding(self.gridPadding)
            }
            Divider()
            Text(scoreLabel + "\(viewModel.score)").font(.headline)
        }
            .padding()
    }
    
    // MARK: Drawing Constants
    
    private let newGameLabel: String = "New Game"
    private let scoreLabel: String = "Score: "
    
    private let cardFlipDuration: Double = 0.7
    
    private let gridPadding: CGFloat = 5.0
    private let spacerMinLength: CGFloat = 10.0
    private let newGameButtonPadding: CGFloat = 13.0
    private let newGameButtonCornerRadius: CGFloat = 10.0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        viewModel.choose(card: viewModel.cards[2])
        return EmojiMemoryGameView(viewModel: viewModel)
    }
}
