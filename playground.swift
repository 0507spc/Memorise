enum Theme { 
    case halloween
    case sport
    case animal
    case fruit
    case face
    case vehicle
    
    var info: (nameOfTheme: String, descriptionOfTheme: String, emojiDeck: Array<String>, numberCards: Int, themeColour: String) {
        switch self {
            case .halloween: return ("halloween", "Spooky Halloween", ["🎃","👻","💀","👽","🕷","🤮"], 6, "Orange")
            case .sport: return ("sports", "Sport Balls", ["⚽️","🏀","🏈","⚾️","🥎","🎾","🎱","🏉","🏐"], 9, "Green")
            case .animal: return ("animals", "Random Animals", ["🐶","🐱","🐰","🦁","🐮","🐷","🐸","🐵","🐤"], 9, "Yellow")
            case .fruit: return ("fruit", "Common Fruits", ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍓","🍒","🥭"], 10, "Red")
            case .face: return ("face", "Faces", ["😀","😍","😝","🤪","😎","😱","😴","😲"], 8, "Black")
            case .vehicle: return ("vehicle", "Vehicles & Transport", ["✈️","🚁","🚘","🚀","⛵️","🚜","🚌","🚲"], 9, "Grey")
            }
        }
    }

let errorCode = Theme.halloween.info.descriptionOfTheme
