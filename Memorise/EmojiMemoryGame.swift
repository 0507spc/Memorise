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


// ObservableObject - this is the reactive UI only works for classes
// this is WHAT TO REDRAW
class EmojiMemoryGame: ObservableObject {
    //private(set) var model: MemoryGame<String> // really called "game" but model for understanding - private to only be allowed to class Emoji... - set means Emoji can set but all can read
//    private var model: MemoryGame<String> =
        // MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { pairIndex in   // type inference means we can don't need it as this: (pairIndex) -> String in
        //     "😀" // return not needed
        // })
        // Rewrite above as:
    //private var model: MemoryGame<String> = createMemoryGame()
    // MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😀" }
    
    // Published is for the reactive UI
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // Static function on the type - not an instance
    static func createMemoryGame() -> MemoryGame<String> {
        //let emojis: Array<String> = ["🎃","👻","💀","👽","🕷"]
        //let emojis = ["🎃","👻","💀","👽","🕷"]
        // MARK: A1.Q2 & A1.Q4.A
        // This shuffles the array of cards to use, then we need to shuffle the actual "deck"
        
        // TODO: This needs to be seperate and have the various options:
        //      Name of Theme
        //      Set of Emoji
        //      Number of cards to show
        //      One theme should be random number of cards to show
        //      Appropriate colour - i.e. halloween is orange
        // Themes should be 1 line of code
        let halloweenEmojis = ["🎃","👻","💀","👽","🕷","🤮"].shuffled()
        let sportsBallsEmojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🎱","🏉","🏐"].shuffled()
        let animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐯","🦁","🐮","🐷","🐸","🐵","🐤"].shuffled()
        let fruitEmojis = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍒","🥭"].shuffled()
        let faceEmojis = ["😀","😍","😝","🤪","😎","😱","😴","😲"].shuffled()
        let vehicleEmojis = ["✈️","🚁","🚘","🚀","🚤","⛵️","🚜","🚌","🚲"].shuffled()
        
        let themesArray = [halloweenEmojis,sportsBallsEmojis,animalEmojis,fruitEmojis,faceEmojis,vehicleEmojis].shuffled()
        
        //let emojis = ["🎃","👻","💀","👽","🕷","🤮"].shuffled() // TODO: shuffle below as well otherwise they are all still together in pairs
        let emojis = themesArray[0]
        
        // the double shuffle is to make 2 pairs not always have the same emojis
        // MARK: A1.Q4.B
        //return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
        // Mace the count between 2 and 5
        // Setting a var to use later
        //let numCards = Int.random(in: 5...5)
        let numCards = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numCards) { pairIndex in
            return emojis[pairIndex]
        }
    }
       
    
    // MARK: - Access to the Model / i.e. cards
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // here could be the get theme function
    //let halloweenEmojis = ["🎃","👻","💀","👽","🕷","🤮"].shuffled()
    //let sportsBallsEmojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🎱","🏉","🏐"].shuffled()
    //let animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🐤"].shuffled()
    //let fruitEmojis = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍒","🥭"].shuffled()
    //let faceEmojis = ["😀","😍","😝","🤪","😎","😱","😴","😲"].shuffled()
    //let vehicleEmojis = ["✈️","🚁","🚘","🚀","🚤","⛵️","🚜","🚌","🚲"].shuffled()
    
    
    // intents allow users to get / chnge cards
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        // This could be SQL / api calls etc
        // This tells the UI to update
        // call anywhere - would be annoying with large code base so will put as @published above
        //objectWillChange.send()
        model.choose(card: card)
    }
    
    
    
}


