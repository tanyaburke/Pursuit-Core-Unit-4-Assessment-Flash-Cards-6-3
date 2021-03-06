//
//  SearchViewController.swift
//  Unit4Assessment
//
//  Created by Tanya Burke on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//


//- **3: Search Online** - a collection view that loads the results of a call to the API below. You can add flash cards to YOUR list using the results of this API call.

//### Adding a Flash Card from the Search tab
//The third view controller loads flash cards from the endpoint below. The user can look through the list of flash cards and add one to their persisted collection using an action sheet. The user should be able to click on a flash card in this collection and view the description using a transition animation.

//The user should be able to delete a flash card from their collection, and should NOT be able to add a card that is a duplicate of one that already exists.


import UIKit
import DataPersistence

class SearchViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Card>!
    
    private let searchView = SearchView()
    
    
    public var userPreference: UserPreference!
    
    private var chosenCard = Card(id: "", quizTitle: "", facts: [""])
    
    private var cardArray = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
                
            }
        }
    }
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchCards()
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
        searchView.collectionView.register(SearchCardCell.self, forCellWithReuseIdentifier: "newCardCell")
        
        searchView.searchBar.delegate = self
        
    }
    
    
    private func fetchCards(){
        CardsAPIClient.fetchCards { [weak self](result) in
            switch result {
            case .failure(let appError):
                self?.showAlert(title: "Error Loading Data", message: "\(appError)")
            case .success(let data):
                self?.cardArray = data
            }
        }
    }
    
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newCardCell", for: indexPath) as? SearchCardCell else {
            fatalError("could not downcast to SearchCardCell")
        }
        
        let card = cardArray[indexPath.row]
        cell.configreCell(for: card)
        cell.delegate = self
        cell.backgroundColor = .systemBackground
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // TODO:
        //        self.chosenCard = cardArray[indexPath.row]
        //        let articleDVC = ArticleDetailViewController()
        // TODO: after assessement we will be using initializers as dependency injection mechanisms
        //        articleDVC.article = article
        
        // step 3: setting up data persistence and its delegate
        //        articleDVC.dataPersistence = dataPersistence
        //        navigationController?.pushViewController(articleDVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if searchView.searchBar.isFirstResponder {
            searchView.searchBar.resignFirstResponder()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            fetchCards()
            return
        }
        fetchCards()
        cardArray = cardArray.filter { $0.quizTitle.lowercased().contains(searchText.lowercased()) }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}


extension SearchViewController: SearchCardCellDelegate {
    func didSelectMoreButton(_ searchCardCell: SearchCardCell, card: Card) {
        print("didSelectMoreButton: \(card.quizTitle)")
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let saveAction = UIAlertAction(title: "Save", style: .default) { alertAction in
            self.saveCard(card)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
    
    private func saveCard(_ card: Card) {
        //        guard let savedCard = card else { return }
        // ADDITION: check for duplicates
        if dataPersistence.hasItemBeenSaved(card) {
            //            if let index = try? dataPersistence.loadItems().firstIndex(of: card) {
            //                do {
            //                    try dataPersistence.deleteItem(at: index)
            //                } catch {
            self.showAlert(title: "Unable to save", message: "This item has already been saved")
        } else {
            do {
                // save to documents directory
                try dataPersistence.createItem(card)
            } catch {
                print("error saving card: \(error)")
            }
        }
    }
}
