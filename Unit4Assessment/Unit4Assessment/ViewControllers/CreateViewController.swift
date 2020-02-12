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
    
    public lazy var backTextOne = createView.cardBackOne
    public lazy var backTextTwo = createView.cardBackSecond
    public lazy var frontText = createView.cardFront
    
    
    private let  cardVC = CardsViewController()
    
    private var card = Card(id: "", quizTitle: "", facts: [""])
    
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
        
        createView.cardBackSecond.delegate = self
        createView.cardBackOne.delegate = self
        createView.cardFront.delegate = self
        
        
    }
    
    @objc private func createButtonPressed(_ sender: UIBarButtonItem) {
        
        if !backTextTwo.hasText || !backTextOne.hasText || !frontText.hasText {
            
            self.showAlert(title: "Incomplete", message: "please compleete all fields")
            
                    } else if ((dataPersistence?.hasItemBeenSaved) != nil){
            
             self.showAlert(title: "Success", message: "This item has been saved")
                        
        }
        guard let firstFact = backTextOne.text, let secondFact = backTextTwo.text, let title = frontText.text  else { return}
        
        card = Card(id: "", quizTitle: title, facts: [firstFact,"\n", secondFact])
        
        createView.cardBackSecond.text = ""
        createView.cardBackOne.text = ""
        createView.cardFront.text = ""
        self.showAlert(title: "Continue?", message: "Complete all fields and hit create to make another FlashCard")
        do {
            
            try dataPersistence.createItem(card)
            //navigationController?.pushViewController(cardVC, animated: true)
            
        } catch {
            print("error saving article: \(error)")
          
        }
//           self.showAlert(title: "Unable to save", message: "This item has already been saved")
    }
    
    
    
    
    
    @objc private func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        createView.cardBackSecond.text = ""
        createView.cardBackOne.text = ""
        createView.cardFront.placeholder = "Please enter a Topic/Tittle"
        self.showAlert(title: "Try again", message: "Complete all fields and hit create to make your FlashCard")
    }
    
}


extension CreateViewController: UITextFieldDelegate {
    
    
}

extension CreateViewController: UITextViewDelegate{
    
    
}
