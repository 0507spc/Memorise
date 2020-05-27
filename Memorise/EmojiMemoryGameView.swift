//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by 0507 on 21/05/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//
// This is the view

import SwiftUI


struct EmojiMemoryGameView: View {
    // This is the object being observed
    // This CASUES THE REDRAW
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
        // MARK: A1.Q5
            // Change largeTitle to other when 5 cards
            //.font(Font.largeTitle)
            //.font(Font.custom(viewModel.cards.count < 5 ? "largeTitle" : "Title"))
            .font(viewModel.cards.count < 5 ? .largeTitle : .title)
        // MARK: A1.Q3
            .scaleEffect(2/3)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    // Example of creating var to use in the body below
    /* // computed property
    var x: Int {
        return 56555666
    }
    */
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
