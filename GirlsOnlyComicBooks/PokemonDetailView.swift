//
//  PokemonDetailView.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 5/1/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit
import AlamofireImage

class PokemonDetailView: UIView {

    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonLocation: UILabel!
    @IBOutlet weak var pokemonAbility1: UILabel!
    @IBOutlet weak var pokemonAbility2: UILabel!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
    @IBOutlet weak var pokemonMoves: UILabel!
    
    
    func setupUIElements(pokemon: Pokemon) {
        
        //setting up the image
        if let url = URL(string: pokemon.sprites) {
            pokemonImage.af_setImage(withURL: url)
        } else { pokemonImage.image = #imageLiteral(resourceName: "pokemonLogo") }
        
        
        //set Up Name Label
        pokemonName.text = pokemon.name
        pokemonName.textColor = Colors.pokemonBlueColor
        pokemonName.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)

        //Set up Number Label
        pokemonNumber.text = "\(pokemon.id)"
        pokemonNumber.textColor = Colors.greyColor
        pokemonNumber.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        
        
        
        
    }
    
}
