//
//  CreateViewController.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

//- **2: Create** - the user can create a flash card here. It should consist of a UITextField and two UITextViews.

//1. Enter the title of the card. e.g "Quick Sort."
//2. Enter a first term (description) for the card. e.g "Uses divide and conquer and splits the array into three parts based on a "pivot" variable."
//3. Enter a second term (description) for the card e.g "Picks an element as pivot and partitions the given array around the picked pivot."
//4. After all required fields are filled in, the user then taps on the "Create" button.
//5. The card should now be visible in the Flash Cards tab.


//### Creating a flash card
//The second view controller allows the user to create a flash card.

//Make sure to handle all required fields appropriately with alerts to the user. e.g "Title is required," or "The Quiz requires two facts." **All fields are required**

import UIKit
import DataPersistence

class CreateViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Card>!
    
    private let createView = CreateView()
    private var createBarButton: UIBarButtonItem!
    private var cancelBarButton: UIBarButtonItem!
    
    
    override func loadView() {
        view = createView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        
        createBarButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createButtonPressed(_:)))
        navigationItem.rightBarButtonItem = createBarButton
        
        cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed(_:)))
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = createBarButton
        
    }
    
    @objc private func createButtonPressed(_ sender: UIBarButtonItem) {
//        if dataPersistence.hasItemBeenSaved(article) {
//          if let index = try? dataPersistence.loadItems().firstIndex(of: article) {
//            do {
//              try dataPersistence.deleteItem(at: index)
//            } catch {
//              print("error deleting article: \(error)")
//            }
//          }
//        } else {
//          do {
//            // save to documents directory
//            try dataPersistence.createItem(article)
//          } catch {
//            print("error saving article: \(error)")
//          }
//        }
        
//        detailVC.article = article
//           detailVC.dataPersistence = dataPersistence
//           navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc private func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}
