//
//  JsonParse.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

public enum CardServiceError: Error {
  case resourcePathDoesNotExist
  case contentsNotFound
  case decodingError(Error)
}

final class CardSupplyService {
  public static func fetchCards() throws -> [Card] {
    guard let path = Bundle.main.path(forResource: "CardData", ofType: "json") else {
      throw CardServiceError.resourcePathDoesNotExist
    }
    guard let json = FileManager.default.contents(atPath: path) else {
      throw CardServiceError.contentsNotFound
    }
    do {
      let cardData = try JSONDecoder().decode([Card].self, from: json)
      return cardData
    } catch {
      throw CardServiceError.decodingError(error)
    }
  }
}
