//
//  ShowFilteredResultsViewController.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit

class ShowFilteredResultsViewController: UIViewController {

    //This comes from SearchFilterViewController
    var pokemonType: Type?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pokemonType?.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //we prepare for segue to pass on
        if segue.identifier == Segues.especificResultsContainer {
            let containerVC = segue.destination as? CollectionViewController
            containerVC?.pokemonTypeToShow = pokemonType
        }
    }

}
