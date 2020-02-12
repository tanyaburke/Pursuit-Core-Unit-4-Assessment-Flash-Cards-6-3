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
    
    public lazy var textFeild: UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "Enter Title of Flash Card"
        tf.backgroundColor = .systemBackground
        return tf
    }()
    
    public lazy var cardFront: UITextView = {
        let cf = UITextView()
        cf.allowsEditingTextAttributes = true
        cf.autocorrectionType = .default
        return cf
    }()
    
    public lazy var cardBack: UITextView = {
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
        
        addSubview(textFeild)
        textFeild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFeild.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            textFeild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textFeild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textFeild.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func setupCardFrontTextConstraints() {
     
                addSubview(cardFront)
                cardFront.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    cardFront.topAnchor.constraint(equalTo: textFeild.bottomAnchor, constant: 20),
                  cardFront.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                  cardFront.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                  cardFront.heightAnchor.constraint(equalToConstant: 180)
                ])
              }
    
    private func setupCardBackTextConstraints() {
       
                  addSubview(cardBack)
                  cardBack.translatesAutoresizingMaskIntoConstraints = false
                  NSLayoutConstraint.activate([
                      cardBack.topAnchor.constraint(equalTo: cardFront.bottomAnchor, constant: 20),
                    cardBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    cardBack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    cardBack.heightAnchor.constraint(equalToConstant: 180)
                  ])
                }
    
    
    
    
}
