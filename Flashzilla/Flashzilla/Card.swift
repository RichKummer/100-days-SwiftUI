//
//  Card.swift
//  Flashzilla
//
//  Created by RichK on 6/18/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//

import Foundation

struct Card: Codable  {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
