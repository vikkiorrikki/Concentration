//
//  Concentration.swift
//  Concentration
//
//  Created by Виктория Саклакова on 11.03.2020.
//  Copyright © 2020 Viktoriia Saklakova. All rights reserved.
//

import Foundation

class Concentration{ //think what public API will be, reference type
    var cards = [Card]() //empty array
    
    var indexOfOneAndOnlyFaceUpCard: Int? //nil when two cards are faced up
    
    func chooseCard(at index: Int) { //play the game
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { //check if cards match
                if cards[matchIndex].identifer == cards[index].identifer{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{//either no cards or two cards are faced up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards { //fill array of cards
            let card = Card()
            cards.append(card)
            cards.append(card) //this 2 strings can be replaced this - cards += [card, card]
        }
        // TODO: shuffle the cards
    }
}
