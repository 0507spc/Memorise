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
            // this is now being done via geometry in the CardView
            //.font(viewModel.cards.count < 5 ? .largeTitle : .title)
        // MARK: A1.Q3
            // this should be .aspectRatio 
            //.scaleEffect(2/3)
            .aspectRatio(2/3)
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
      // this is to make the font / sizes dynamic
      // lets you get the value of the view so width / height - think portrait / landscape etc
      GeometryReader { geometry in
            self.body(for: geometry.s
    }

    // Function to allow not having to put in selfs in the code (so Zstack moves into the function 
    // and gets called above
    func body(for size: CGSize) -> some view {
      ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            // because of padding and the card border need the modifier (0.75)
            // the 0.75 "magic" number should be defined else where
            .font(Font.system(size: fontSize(for: size)))
        }
    }
  
    // MARK: - Drawing Constants
    // this would infer int which RoundedRect does not expect
    //let cornerRadius = 10
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
      min(size.width, size.height) * 0.75
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
