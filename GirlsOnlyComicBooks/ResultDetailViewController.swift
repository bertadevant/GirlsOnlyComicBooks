//
//  ResultDetailViewController.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit

class ResultDetailViewController: UIViewController {
    
    var pokemonToShow: Pokemon?
    var detailView: PokemonDetailView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView = Bundle.main.loadNibNamed(NibNames.DetailViewNib, owner: self, options: nil)?.first as? PokemonDetailView
        guard let pokemonToShow = pokemonToShow else {
            //if we did not succesfully pass it dismiss and go back
            self.dismiss(animated: true, completion: nil)
            return
        }
        detailView?.setupUIElements(pokemon: pokemonToShow)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
