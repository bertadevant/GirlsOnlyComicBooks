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
        pokemonName.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)

        //Set up Number Label
        pokemonNumber.text = "#\(pokemon.id)"
        pokemonNumber.textColor = Colors.greyColor
        pokemonNumber.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        
        
        //PokemonType Label1
        if let firstType = pokemon.type.first {
            pokemonType1.text = firstType.rawValue
            pokemonType1.textColor = .white
            pokemonType1.backgroundColor = firstType.getColor()
        }
        
        //PokemonType Label2
        if pokemon.type.indices.contains(1) {
            let secondType = pokemon.type[1]
            pokemonType2.text = secondType.rawValue
            pokemonType2.textColor = .white
            pokemonType2.backgroundColor = secondType.getColor()
        }

        
        //POkemon Ability
        if let firstAbility = pokemon.abilities.first {
            pokemonAbility1.text = "Ability: \(firstAbility.name)"
            pokemonAbility1.textColor = Colors.blackColor
            pokemonAbility1.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        }
        
        //POkemon Location 
        var text = ""
        for location in pokemon.location_area_encounters {
            text += "\(location.location_area)-\(location.version_details) | "
        }
        pokemonLocation.text = text
        pokemonLocation.textColor = Colors.greyColor
        pokemonLocation.font = UIFont.systemFont(ofSize: 10, weight: UIFontWeightRegular)
        
        //Pokemon Moves
        var movesText = ""
        for move in pokemon.moves {
            movesText += "\(move.name) | "
        }
        pokemonMoves.text = "Moves it can learn: \(movesText)"
        
        
    }
    
}
