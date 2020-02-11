//
//  TabBarController.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class TabBarController: UITabBarController {
    
    private var dataPersistence = DataPersistence<Card>(filename: "savedCards.plist")
    
    private var userPreference = UserPreference()
    
    private lazy var cardsVC: CardsViewController = {
        
        
        let viewController = CardsViewController()
        
        viewController.tabBarItem = UITabBarItem(title: "SavedCards", image: UIImage(systemName: "square.and.pencil"), tag: 0)
        
        
        viewController.dataPersistence = dataPersistence
        
        return viewController
    }()
    
    private lazy var createVC: CreateViewController = {
        let viewController = CreateViewController()
        
        
        viewController.dataPersistence = dataPersistence
        
        // step 6: setting up data persistence and its delegate
        //            viewController.dataPersistence.delegate = viewController
        
        viewController.tabBarItem = UITabBarItem(title: "CreateCards", image: UIImage(systemName: "pencil.and.outline"), tag: 1)
        return viewController
    }()
    
    private lazy var searchVC: SearchViewController = {
        let viewController = SearchViewController()
        
        viewController.dataPersistence = dataPersistence
        //            viewController.dataPersistence.delegate = viewController
        
        
        viewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle.fill"), tag: 2)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //            viewControllers = [UINavigationController(rootViewController: cardsVC),
        //                               UINavigationController(rootViewController: createVC),
        //                               UINavigationController(rootViewController: searchVC)]
        
        viewControllers = [cardsVC,createVC,searchVC]
    }
}
