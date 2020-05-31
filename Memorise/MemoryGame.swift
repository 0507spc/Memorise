//
//  MemoryGame.swift
//  Memorise
//
//  Created by 0507 on 21/05/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//
// This is the model

import Foundation
// thisbis the model
struct MemoryGame<CardContent> where CardContent: Equatable { // memory game only works when cards are comparable (constrains)
    var cards: Array<Card>
    
    // This is for matching in the game
    var indexOfTehOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
                
            // Below is replaced by above
            /*
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            */
                
            // Below is replaced by extension of Array
            /*
            if faceUpCardIndices.count == 1 {
                // this is the nil
                return faceUpCardIndices.first
            } else {
                return nil
            }
            */
        set {
            for index in cards.indices {
                // newValue looks for changes only for computed / when changed
                /*if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }*/
                // the if above can be replaced by:
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    // functions in STRUCTS are immutable by default
    // make mutating to allow changing
    mutating func choose(card: Card) {
        //print("card chosen: \(card)") // consolse debugging
        // game logic
        // Can use the nex array extension
        //let chosenIndex: Int = self.index(of: card)
        // after the && is for matching component, , is sequential && (so && = ,)
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched { // run when NOT nil
            if let potentialMatchIndex = indexOfTehOneAndOnlyFaceUpCard {
                // == can't do ==, as it is a don't care it doesn't know the type
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // we have a match
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                // this is not needed with the get / set computed
                //indexOfTehOneAndOnlyFaceUpCard = nil
                self.cards[chosenIndex].isFaceUp = true
            } else {
                // This is managed by the get / set
                //for index in cards.indices {
                //    cards[index].isFaceUp = false
                //}
                indexOfTehOneAndOnlyFaceUpCard = chosenIndex
            }
            
            // get card out of array and flip
            //let chosenCard: Card = self.cards[chosenIndex]
            //chosenCard.isFaceUp= !chosenCard.isFaceUp
            // need reactie UI to make this take effect
            //self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
            // this is now done above and not needed here
            //self.cards[chosenIndex].isFaceUp = true
        }
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // This would be image / sound / whatever
        var id: Int
    }
}





