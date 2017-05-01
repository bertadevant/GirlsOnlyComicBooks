//
//  SecondViewController.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/29/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit

class SearchFilterViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    
    private var pokemonType: Type?
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var collectionViewElements: [Type] = []
    private let searchViewModel = SearchFilterViewModel()
    //search Controller
    var searchController : UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: NibNames.TypeCategoryCell, bundle: nil), forCellWithReuseIdentifier: ReuseID.catgeoryTypeCell)
        setUpSearchController()
        collectionViewElements = searchViewModel.types
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
// MARK: Search
    
    func setUpSearchController() {
        
        // Initializing with searchResultsController set to nil means that
        // searchController will use this view controller to display the search results
        searchController = UISearchController(searchResultsController: nil)
        //search controller will control the results and updates
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search by Pokemon Name"
        //we set the delegate to be this VC and not the UISearchController because this way we can force it to wait until user clicks send before calling updateSeacrhResults
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        //sets the search bar as the title on the navBar
        searchController.searchBar.sizeToFit()
        navigationItem.titleView = searchController.searchBar
        // Sets this view controller as presenting view controller for the search interface
        self.definesPresentationContext = true
        self.extendedLayoutIncludesOpaqueBars = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //hide keyboard
        searchController.searchBar.resignFirstResponder()
        if let searchText = searchController.searchBar.text {
            //guard to check if the text is empty
            guard !searchText.isEmpty else { return }
            
            
        }
    }
    
    @available(iOS 8.0, *)
    func updateSearchResults(for searchController: UISearchController) {
        //we leave it empty because I just want to do a call at the end
    }

    
    
}

extension SearchFilterViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let typeSelected = collectionViewElements[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let showResultsVC = storyboard.instantiateViewController(withIdentifier: ViewControllerID.ShowFilteredResultsVC) as? ShowFilteredResultsViewController else { return }
        showResultsVC.pokemonType = typeSelected
        self.performSegue(withIdentifier: Segues.especificResultsContainer, sender: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewElements.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: TypeCategoryCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: ReuseID.catgeoryTypeCell, for: indexPath) as! TypeCategoryCollectionViewCell)
        cell.setUpUIElements(type: collectionViewElements[indexPath.row])
        
        return cell

    }
}

