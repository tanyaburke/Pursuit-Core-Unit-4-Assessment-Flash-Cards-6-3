//
//  Model.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

struct Results: Codable {
    let cardListType: String
    let apiVersion: String
    let cards: [Card]
}

struct Card: Codable & Equatable {
    let id: String
    let cardTitle: String
    let facts: [String]
}
