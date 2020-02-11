//
//  SavedCardsCell.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//


//The first view controller contains the user's flash card collection. When the view loads, each "card" should show the title of the card. When a user taps the card, it should use an animation to load the "back" of the card, which lists the description (facts) of the card.
//
//The user should be able to delete a flash card from their collection, and should NOT be able to add a card that is a duplicate of one that already exists.

import UIKit


protocol SavedCardCellDelegate: AnyObject{
    func didSelectMoreButton(_ savedCardCell: SavedCardsCell, card: Card)
    }

   
class SavedCardsCell: UICollectionViewCell {

      // step 2: custom protocol
      weak var delegate: SavedCardCellDelegate?
      
      // to keep track of the current cell's article
      private var currentCard: Card!
      
      private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(didLongPress(_:)))
        return gesture
      }()

      
      // more button
      // article title
      // news image
      public lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        button.addTarget(self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
        return button
      }()
      
      public lazy var articleTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        label.text = "Front of card."
        label.numberOfLines = 0
        return label
      }()
      
      public lazy var backOfCard: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .justified
        label.text = "Back  of Card"
        label.numberOfLines = 0
        return label
      }()
      
      private var isShowingBack = false
      
      override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
      }
      
      required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
      }
      
      private func commonInit() {
        setupMoreButtonConstraints()
        setupArticleTitleConstraints()
       setupBackOfCardConstraints()
        layer.borderColor = UIColor.systemGray.cgColor
        layer.borderWidth = 1.0
        addGestureRecognizer(longPressGesture)
      }
      
      @objc private func didLongPress(_ gesture: UILongPressGestureRecognizer) {
//        guard let currentCard = currentCard else { return }
        if gesture.state == .began || gesture.state == .changed {
          return
        }
        
        isShowingBack.toggle() // true -> false -> true
    
        self.animate()

        }
      
      
      private func animate() {
        let duration: Double = 1.0 // seconds
        if isShowingBack{
          UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
            self.backOfCard.alpha = 1.0
            self.articleTitle.alpha = 0.0
          }, completion: nil)
        } else {
          UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
            self.backOfCard.alpha = 0.0
            self.articleTitle.alpha = 1.0
          }, completion: nil)
        }
      }
      
      @objc private func moreButtonPressed(_ sender: UIButton) {
        // step 3: custom protocol
        delegate?.didSelectMoreButton(self, card: currentCard)
      }
      
      private func setupMoreButtonConstraints() {
        addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          moreButton.topAnchor.constraint(equalTo: topAnchor),
          moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
          moreButton.heightAnchor.constraint(equalToConstant: 44),
          moreButton.widthAnchor.constraint(equalTo: moreButton.heightAnchor)
        ])
      }
      
      private func setupArticleTitleConstraints() {
        addSubview(articleTitle)
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          articleTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
          articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
          articleTitle.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
          articleTitle.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
      }
      
      private func setupBackOfCardConstraints() {
        addSubview(backOfCard)
        backOfCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          backOfCard.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
          backOfCard.leadingAnchor.constraint(equalTo: leadingAnchor),
          backOfCard.bottomAnchor.constraint(equalTo: bottomAnchor),
          backOfCard.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
      }
      
     
    public func configreCell(for savedCard: Card) {
        currentCard = savedCard
        
        articleTitle.text = savedCard.cardTitle
        backOfCard.text = savedCard.facts.description
        
      }
    }


