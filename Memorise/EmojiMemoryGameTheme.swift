//
//  EmojiMemoryGameTheme.swift
//  Memorise
//
//  Created by 0507 on 05/06/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//

import SwiftUI


// looked at other code due to not working out how to get on single line.
// implement this by looking at other examples and not using the code on the other git.

// Assignment 2 Task 6
public let themes: [Theme] = [
    Theme(
        nameOfTheme: "halloween",
        descriptionOfTheme: "Spooky Halloween",
        emojiDeck: ["🎃","👻","💀","👽","🕷","🤮"],
        numberCards: 6,
        themeColour: .orange,
        id: 0
    ),
    Theme(
        nameOfTheme: "sports",
        descriptionOfTheme: "Sport Balls",
        emojiDeck: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🎱","🏉","🏐"],
        numberCards: 9,
        themeColour: .green,
        id: 1
    ),
    Theme(
        nameOfTheme: "animals",
        descriptionOfTheme: "Random Animals",
        emojiDeck: ["🐶","🐱","🐰","🦁","🐮","🐷","🐸","🐵","🐤"],
        numberCards: 9,
        themeColour: .yellow,
        id: 2
    ),
    Theme(
        nameOfTheme: "fruits",
        descriptionOfTheme: "Common Fruits",
        emojiDeck: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍓","🍒","🥭"],
        numberCards: 10,
        themeColour: .red,
        id: 3
    ),
    Theme(
        nameOfTheme: "face",
        descriptionOfTheme: "Faces",
        emojiDeck: ["😀","😍","😝","🤪","😎","😱","😴","😲"],
        numberCards: 8,
        themeColour: .black,
        id: 4
    ),
    Theme(
        nameOfTheme: "vehicles",
        descriptionOfTheme: "Vehicles & Transport",
        emojiDeck: ["✈️","🚁","🚘","🚀","⛵️","🚜","🚌","🚲"],
        numberCards: 9,
        themeColour: .blue,
        id: 5
    )
]




// Assignment 2 Task 3
public struct Theme: Identifiable {
    let nameOfTheme: String
    let descriptionOfTheme: String
    let emojiDeck: [String]
    let numberCards: Int?
    let themeColour: Color
    public let id: Int
}
