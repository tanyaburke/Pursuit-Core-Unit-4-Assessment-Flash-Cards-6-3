//
//  UserPrefrences.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation




struct UserKey {
    static let savedCardArray = [Card]()
}

//protocol UserPreferenceDelegate: AnyObject {
//  func didChangeNewsSection(_ userPreference: UserPreference, sectionName: String)
//}
//
//final class UserPreference {
//  weak var delegate: UserPreferenceDelegate?
//
//  public func getSectionName() -> String? {
//    return UserDefaults.standard.object(forKey: UserKey.savedCardSet) as? String
//  }
//
//  public func setSectionName(_ sectionName: String) {
//    UserDefaults.standard.set(sectionName, forKey: UserKey.savedCardSet)
//    delegate?.didChangeNewsSection(self, sectionName: sectionName)
//  }
//}
