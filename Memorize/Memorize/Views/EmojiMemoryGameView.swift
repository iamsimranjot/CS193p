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
                Spacer(minLength: 10.0)
                Button(action: viewModel.newGame) {
                    Text("New Game")
                        .padding(13)
                        .foregroundColor(.white)
                        .background(viewModel.theme.primaryColor)
                        .cornerRadius(10)
                        .font(.subheadline)
                }
            }
            Grid(viewModel.cards) { card in
                CardView(card: card, primaryColor: self.viewModel.theme.primaryColor).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                    .padding(self.gridPadding)
            }
            Divider()
            Text("Score: \(viewModel.score)").font(.headline)
        }
                .padding()
    }
    
    // MARK: Drawing Constants
    
    let gridPadding: CGFloat = 5;
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}