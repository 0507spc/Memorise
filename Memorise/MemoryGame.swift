//
//  MemoryGame.swift
//  Memorise
//
//  Created by 0507 on 21/05/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//
// This is the model

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    // functions in STRUCTS are immutable by default
    // make mutating to allow changing
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        // game logic
        // Can use the nex array extension
        //let chosenIndex: Int = self.index(of: card)
        let chosenIndex: Int = cards.firstIndex(matching: card)
        
        // get card out of array and flip
        //let chosenCard: Card = self.cards[chosenIndex]
        //chosenCard.isFaceUp= !chosenCard.isFaceUp
        // need reactie UI to make this take effect
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    // 'of' external 'card' internal names
    /*
    func index(of card: Card) -> Int {
        // this just gets the index
        // card is identifiable see below
        // this searches to find the index number for the card
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        // when not found
        return 0 // TODO: bogus!
    }
    */
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>() // empty array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        // shuffle the random deck
        cards.shuffle()
    }
    
    // value types are copied (never altered)
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // This would be image / sound / whatever
        var id: Int
    }
}





