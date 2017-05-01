//
//  PokemonImageCollectionViewCell.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit
import AlamofireImage

class PokemonImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonSprite: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    
    
    func setUpUIElements(pokemon: Pokemon) {
        
        //Set up Image
        if let url = URL(string: pokemon.sprites) {
            pokemonSprite.af_setImage(withURL: url)
        } else { pokemonSprite.image = #imageLiteral(resourceName: "pokemonLogo") }
        
        //Set up Name Label
        pokemonName.text = pokemon.name
        pokemonName.textColor = .white
        pokemonName.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
        
        //Set up Number Label
        pokemonNumber.text = "\(pokemon.id)"
        pokemonNumber.textColor = .white
        pokemonNumber.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightMedium)
    }
}
