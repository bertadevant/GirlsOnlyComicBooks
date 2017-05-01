//
//  PokemonCollectionViewCell.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit
import AlamofireImage

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonSprite: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
    
    func setUpUIElements(pokemon: Pokemon) {
        
        //Set up Image
        if let url = URL(string: pokemon.sprites) {
            pokemonSprite.af_setImage(withURL: url)
        } else { pokemonSprite.image = #imageLiteral(resourceName: "pokemonLogo") }
        
        //Set up Name Label
        pokemonName.text = pokemon.name
        pokemonName.textColor = Colors.pokemonBlueColor
        pokemonName.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
        
        //Set up Number Label
        pokemonNumber.text = "\(pokemon.id)"
        pokemonNumber.textColor = Colors.greyColor
        pokemonNumber.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        
        
        //PokemonType Label1
        if let firstType = pokemon.type.first {
            pokemonType1.text = firstType.rawValue
            pokemonType1.textColor = .white
            pokemonType1.backgroundColor = firstType.getColor()
        } else { pokemonType1.isHidden = true }
        
        //PokemonType Label2
        if pokemon.type.indices.contains(1) {
            let secondType = pokemon.type[1]
            pokemonType2.text = secondType.rawValue
            pokemonType2.textColor = .white
            pokemonType2.backgroundColor = secondType.getColor()
        } else { pokemonType2.isHidden = true }

        
    }
}
