//
//  Model.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation


//struct Results: Codable & Equatable {
//    let cards: [Card]
//}


struct Card: Codable & Equatable {
    let id: String?
   let quizTitle: String
    let facts: [String]
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
      return lhs.quizTitle == rhs.quizTitle
    }
}

