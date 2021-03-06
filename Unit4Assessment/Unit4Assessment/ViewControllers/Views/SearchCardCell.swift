//
//  SearchCardCell.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol SearchCardCellDelegate: AnyObject{
      func didSelectMoreButton(_ searchCardCell: SearchCardCell, card: Card)
      }


class SearchCardCell: UICollectionViewCell {

  
          // step 2: custom protocol
          weak var delegate: SearchCardCellDelegate?
          
          // to keep track of the current cell's article
          private var currentCard: Card!
          
          private lazy var longPressGesture: UILongPressGestureRecognizer = {
            let gesture = UILongPressGestureRecognizer()
            gesture.addTarget(self, action: #selector(didLongPress(_:)))
            return gesture
          }()

   
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
            label.alpha = 1
            label.numberOfLines = 0
            return label
          }()
          
          public lazy var backOfCard: UILabel = {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .subheadline)
            label.textAlignment = .justified
            label.text = "Back  of Card"
            label.numberOfLines = 0
            label.alpha = 0
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
                self.moreButton.alpha = 0.0
                self.articleTitle.alpha = 0.0
              }, completion: nil)
            } else {
              UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
                self.backOfCard.alpha = 0.0
                self.moreButton.alpha = 1.0
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
              backOfCard.topAnchor.constraint(equalTo: topAnchor),
              backOfCard.leadingAnchor.constraint(equalTo: leadingAnchor),
              backOfCard.bottomAnchor.constraint(equalTo: bottomAnchor),
              backOfCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
          }
          
         
        public func configreCell(for savedCard: Card) {
            currentCard = savedCard
            
            articleTitle.text = savedCard.quizTitle
            backOfCard.text = savedCard.facts.description
            
          
        }



}
