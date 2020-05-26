//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by 0507 on 21/05/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//
// This is the glue, view model


import SwiftUI

// This can be inlined in the below and would be the way to do it, in this exampe at least
// func createCardContent i.e. line 21/ MemoryGame

// Class instead of a struct - portal between view and model
//


class EmojiMemoryGame {
    //private(set) var model: MemoryGame<String> // really called "game" but model for understanding - private to only be allowed to class Emoji... - set means Emoji can set but all can read
//    private var model: MemoryGame<String> =
        // MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { pairIndex in   // type inference means we can don't need it as this: (pairIndex) -> String in
        //     "😀" // return not needed
        // })
        // Rewrite above as:
    //private var model: MemoryGame<String> = createMemoryGame()
    // MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😀" }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // Static function on the type - not an instance
    static func createMemoryGame() -> MemoryGame<String> {
        //let emojis: Array<String> = ["🎃","👻","💀","👽","🕷"]
        //let emojis = ["🎃","👻","💀","👽","🕷"]
        // MARK: A1.Q2 & A1.Q4.A
        let emojis = ["🎃","👻","💀","👽","🕷","🤮"].shuffled()
        // MARK: A1.Q4.B
        //return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
        // Mace the count between 2 and 5
        // Setting a var to use later
        //let vNumCards = Int.random(in: 5...5)
        let vNumCards = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: vNumCards) { pairIndex in
            return emojis[pairIndex]
        }
    }
       
    
    
    // MARK: - Access to the Model / i.e. cards
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    
    
    // intents allow users to get / chnge cards
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        // This could be SQL / api calls etc
        model.choose(card: card)
    }
    
    
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
