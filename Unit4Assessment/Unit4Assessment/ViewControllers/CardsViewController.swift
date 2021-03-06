//
//  CardsViewController.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

//- **1: Cards** - a collection view of all YOUR flash cards.

//### Flash cards collection
//The first view controller contains the user's flash card collection. When the view loads, each "card" should show the title of the card. When a user taps the card, it should use an animation to load the "back" of the card, which lists the description (facts) of the card.
//
//The user should be able to delete a flash card from their collection, and should NOT be able to add a card that is a duplicate of one that already exists.

import UIKit
import DataPersistence


class CardsViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Card>!
    
    private let savedCardsView = CardsView()
    
    private var savedCards = [Card]() {
        didSet {
            if savedCards.isEmpty {
                
                savedCardsView.collectionView.backgroundView = EmptyView(title: "Saved Articles", message: "There are currently no saved FlashCards. Start by creating your own in the Create tab, or adding one from the Search tab .")
            } else {
                
                savedCardsView.collectionView.backgroundView = nil
                
                savedCardsView.collectionView.reloadData()
                
            }
        }
    }
    
    override func loadView() {
        view = savedCardsView
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        fetchSavedCards()
        savedCardsView.collectionView.dataSource = self
        savedCardsView.collectionView.delegate = self
        
        savedCardsView.collectionView.register(SavedCardsCell.self, forCellWithReuseIdentifier: "cardCell")
        
    }
    
    public func fetchSavedCards() {
        do {
            savedCards = try dataPersistence.loadItems()
        } catch {
            print("error fetching articles: \(error)")
        }
    }
}

extension CardsViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return savedCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? SavedCardsCell else {
            fatalError("could not downcast to SavedCardsCell")
        }
        let currentCard = savedCards[indexPath.row]
        cell.configreCell(for: currentCard)
        cell.backgroundColor = .systemBackground
        cell.delegate = self
        return cell
    }
}



extension CardsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItems: CGFloat = 10
        let numberOfItems: CGFloat = 1
        let itemHeight: CGFloat = maxSize.height * 0.30
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        return CGSize(width: itemWidth, height: itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}


extension CardsViewController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        fetchSavedCards()
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        fetchSavedCards()
    }
}

extension CardsViewController: SavedCardCellDelegate {
    func didSelectMoreButton(_ savedCardCell: SavedCardsCell, card: Card) {
        print("didSelectMoreButton: \(card.quizTitle)")
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { alertAction in
            self.deleteItem(card)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        present(alertController, animated: true)
    }
    
    private func deleteItem(_ card: Card) {
        guard let index = savedCards.firstIndex(of: card) else {
            return
        }
        do {
            try dataPersistence.deleteItem(at: index)
        } catch {
            print("error deleting article: \(error)")
        }
        showAlert(title: "Deleted", message: "Item has been removed")
    }
}
