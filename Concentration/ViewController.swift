//
//  ViewController.swift
//  Concentration
//
//  Created by Виктория Саклакова on 09.03.2020.
//  Copyright © 2020 Viktoriia Saklakova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    //lazy because we use cardButtons before its initialization, can't use didSet
    //this var is as link between Controller and Model
    
    var flipCount = 0{
        didSet{ //updating var value
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]! //it can be Array<UIButtons>
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("index of card = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else{
            print("Chosen card is not in array.")
        }
        flipCount += 1
    }
    
    func updateViewFromModel(){ // button matches the card
        for index in cardButtons.indices { //.indices() return countable range
            print("index of range = \(index)")
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0) : #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1) //if cards are matched we don't wanna hide it again
            }
        }
    }
    
    var emojiChoices = ["❤️", "♎️", "🧸", "🔫"]
    var emoji = [Int:String]() //it equals Dictionary<Int, String>
    
    func emoji(for card: Card) -> String {
        print("index of card identifier = \(card.identifer)")
        if emoji[card.identifer] == nil{ //fill dictionary
            if emojiChoices.count > 0{ //you can also write conditions by comma
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifer] = emojiChoices.remove(at: randomIndex) //.remove is for never using some emoji in array again
            }
        }
        return emoji[card.identifer] ?? "Chosen card is not here"
    }

}

