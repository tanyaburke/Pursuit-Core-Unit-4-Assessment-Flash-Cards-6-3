//
//  SearchView.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

//The user should be able to delete a flash card from their collection, and should NOT be able to add a card that is a duplicate of one that already exists.

import UIKit

class SearchView: UIView {

        public lazy var searchBar: UISearchBar = {
           let sb = UISearchBar()
           sb.autocapitalizationType = .none
           sb.placeholder = "search for card"
           return sb
         }()
    
    
    public lazy var collectionView: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                layout.itemSize = CGSize(width: 100, height: 100)
                let cv = UICollectionView (frame: CGRect.zero, collectionViewLayout: layout)
                cv.backgroundColor = .yellow
                return cv
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
                    setupSearchBarConstraints()
                    setupCollectionViewConstraints()
                }
          private func setupSearchBarConstraints() {
             // 1.
             addSubview(searchBar)
             
             // 2.
             searchBar.translatesAutoresizingMaskIntoConstraints = false
             
             // 3.
             NSLayoutConstraint.activate([
               searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
               searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
               searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
             ])
           }
           
           private func setupCollectionViewConstraints() {
             addSubview(collectionView)
             collectionView.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
               collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
               collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
               collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
               collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
             ])
           }
         }
