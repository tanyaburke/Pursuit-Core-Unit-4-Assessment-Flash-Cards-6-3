//
//  CreateView.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//


// - **2: Create** - the user can create a flash card here. It should consist of a UITextField and two UITextViews.

//1. Enter the title of the card. e.g "Quick Sort."
//2. Enter a first term (description) for the card. e.g "Uses divide."
//3. Enter a second term (description) for the card e.g "Picks an element."
//4. After all required fields are filled in, the user then taps on the "Create" button.
//5. The card should now be visible in the Flash Cards tab.


//### Creating a flash card
//The second view controller allows the user to create a flash card.

//Make sure to handle all required fields appropriately with alerts to the user. e.g "Title is required," or "The Quiz requires two facts." **All fields are required**

//The user should be able to delete a flash card from their collection, and should NOT be able to add a card that is a duplicate of one that already exists.

import UIKit

class CreateView: UIView {
    
    public lazy var cardFront: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Title of Flash Card"
        tf.backgroundColor = .systemBackground
        return tf
    }()
    
    public lazy var cardBackOne: UITextView = {
        let cf = UITextView()
        cf.allowsEditingTextAttributes = true
        cf.autocorrectionType = .default
        return cf
    }()
    
public lazy var cardBackSecond: UITextView = {
        let cb = UITextView()
        cb.allowsEditingTextAttributes = true
        cb.autocorrectionType = .default
        return cb
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupTextFeildConstraints()
        setupCardFrontTextConstraints()
        setupCardBackTextConstraints()
    }
    
    private func setupTextFeildConstraints() {
        
        addSubview(cardFront)
        cardFront.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardFront.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cardFront.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardFront.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardFront.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func setupCardFrontTextConstraints() {
     
                addSubview(cardBackOne)
                cardBackOne.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    cardBackOne.topAnchor.constraint(equalTo: cardFront.bottomAnchor, constant: 20),
                  cardBackOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                  cardBackOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                  cardBackOne.heightAnchor.constraint(equalToConstant: 180)
                ])
              }
    
    private func setupCardBackTextConstraints() {
       
                  addSubview(cardBackSecond)
                  cardBackSecond.translatesAutoresizingMaskIntoConstraints = false
                  NSLayoutConstraint.activate([
                      cardBackSecond.topAnchor.constraint(equalTo: cardBackOne.bottomAnchor, constant: 20),
                    cardBackSecond.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    cardBackSecond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    cardBackSecond.heightAnchor.constraint(equalToConstant: 180)
                  ])
                }
    
    
    
    
}
