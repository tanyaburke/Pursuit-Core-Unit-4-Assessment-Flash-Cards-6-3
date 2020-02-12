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
    // data for our collection view
    private var cardArray = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
//                self.navigationItem.title = (self.newsArticles.first?.section.capitalized ?? " ") + " News"
            }
        }
    }
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // white when dark mode is off, black when dark mode is on
        
        // setting up collection datasource and delegate
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
        
        // register a collection view cell
        searchView.collectionView.register(SearchCardCell.self, forCellWithReuseIdentifier: "newCardCell")
        
        // setup search bar
        searchView.searchBar.delegate = self
        
//        let sectionName = userPreference.getSectionName() ?? "Technology"
//        fetchStories(sectionName)
    }
    // TODO:
//    private func fetchCards(){
//        do{
//          try  CardSupplyService.fetchCards()
//
//        } catch{
//
//        }
//    }
    // TODO:
    private func fetchCards(){
//        CardsAPIClient.fetchCards { [weak self](results) in
//            switch results{
//            case .failure:
//                
//                
//            case .success(let cards):
//                
//                
//            }
//        }
    }
    
    // TODO:
//    private func fetchStories(_ section: String) {
//        NYTTopStoriesAPIClient.fetchTopStories(for: section) { [weak self] (result) in
//            switch result {
//            case .failure(let appError):
//                print("fetching stories error: \(appError)")
//            case .success(let articles):
//                self?.newsArticles = articles
//            }
//        }
//    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO:
//        return cardArray.count
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newCardCell", for: indexPath) as? SearchCardCell else {
            fatalError("could not downcast to SearchCardCell")
        }
        // TODO:
//        let card = cardArray[indexPath.row]
//        cell.configreCell(for: card)
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
//            fetchStories(sectionName)
            return
        }
        // filter articles based on searchText
        cardArray = cardArray.filter { $0.quizTitle.lowercased().contains(searchText.lowercased()) }
    }
}

// ADDITION: conforming to UserPreferenceDelegate
//extension NewsFeedViewController: UserPreferenceDelegate {
//    func didChangeNewsSection(_ userPreference: UserPreference, sectionName: String) {
//        fetchStories(sectionName)
//    }
//}



extension SearchViewController: SearchCardCellDelegate {
  func didSelectMoreButton(_ searchCardCell: SearchCardCell, card: Card) {
    print("didSelectMoreButton: \(card.quizTitle)")
    // create an action sheet
    // cancel action
    // delete action
    // post MVP shareAction
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    let saveAction = UIAlertAction(title: "Save", style: .default) { alertAction in
      self.saveCard(card)
    }
    alertController.addAction(cancelAction)
    alertController.addAction(saveAction)
    present(alertController, animated: true)
  }
//
    private func saveCard(_ card: Card) {
//     guard let savedCard = card else { return }
//       // ADDITION: check for duplicates
//       if dataPersistence.hasItemBeenSaved(article) {
//         if let index = try? dataPersistence.loadItems().firstIndex(of: article) {
//           do {
//             try dataPersistence.deleteItem(at: index)
//           } catch {
//             print("error deleting article: \(error)")
           }
//         }
//       } else {
//         do {
//           // save to documents directory
//           try dataPersistence.createItem(article)
//         } catch {
//           print("error saving article: \(error)")
//         }
//       }
}
