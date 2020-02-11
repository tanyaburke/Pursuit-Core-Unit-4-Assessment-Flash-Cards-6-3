//
//  Model.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation



struct Results: Codable{
   var empty: [Card]
}

struct Card: Codable & Equatable {
    let id: String
    let quizTitle: String
    let facts: [String]
}

typealias Empty = [Card]
