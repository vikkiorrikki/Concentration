//
//  Card.swift
//  Concentration
//
//  Created by Виктория Саклакова on 11.03.2020.
//  Copyright © 2020 Viktoriia Saklakova. All rights reserved.
//

import Foundation

struct Card{ //not inheritance, value type
    var isFaceUp = false
    var isMatched = false
    var identifer: Int
    
    static var identiferFactory = 0
    
    static func getUniqueIdentifer() -> Int{ //statis func is func that can't send to a card (func for type?)
        identiferFactory += 1
        return identiferFactory
    }
    
    func someFunc(){
        
    }
    init() {
        self.identifer = Card.getUniqueIdentifer()
    }
}
