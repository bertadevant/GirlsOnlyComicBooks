//
//  PokemonModel.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import Foundation
import UIKit

/* Model currently using to show Pokemon http://pokeapi.co/docsv2/#pokemon */
struct Pokemon: ObjectsFromAPI {
    var id: Int
    var name: String
    /* Pokemon only variables; you get a lot of variables from the API but I chose to get only the ones I am going to use to sort pokemons */
    //Set for exactly one Pokémon used as the default for each species
    var is_default: Bool
    //Order for sorting. Almost national order, except families are grouped together
    var order: Int
    //The weight of this Pokémon
    var weight: Int
    //A Set of abilities this Pokémon could potentially have; we chose a Set instead on an Array here because the order is irrelavant but we want to make sure no Ability is repeated
    var abilities: Set<PokemonAbility>
    //Set of all the moves object a pokemon can have
    var moves: Set<PokemonMove>
    //A array to a list of location areas as well as encounter details pertaining to specific versions. We use an array here because the order will be important. We want to organize them by game year
    var location_area_encounters: [LocationAreaEncounter]
    //Arra of the different types this Pokemon has, types == MoveType; any pokemon can have 1 or 2 types it can't ever be 0 or >2 
    var type: [Type]
    //A set of sprites used to depict this Pokémon in the game. You can get more than one sprite for each pokemon, for this app I will only use the default one: front_default http://pokeapi.co/docsv2/#pokemonsprites
    var sprites: String
    
}


/* Model to store the Abilities a Pokemon can have http://pokeapi.co/docsv2/#pokemonability */
struct PokemonAbility {
    
    /* The API creates a different Model to get the Ability of a Pokemon but for sake of simplicity I will add it inside my PokemonAbility Object http://pokeapi.co/docsv2/#abilities */
    /* There are many more thing about Abilities on the API but I have chosen only to store name, and ID because for the purpose of this exercise I only want to use Abilities as a way to sort pokemon */
    //The identifier for this ability resource
    var id: Int
    //The name for this ability resource
    var name: String
    //The slot this ability occupies in this Pokémon species
    var slot: Int
    //Whether or not this is a hidden ability
    var is_hidden: Bool
    
}

/* Model for the different Moves Object a pokemon can have; I am only interested in little information http://pokeapi.co/docsv2/#move from this API */
struct PokemonMove {
    //The identifier for this move resource, it is an URL you can use to get more info into the move
    /* To get a specific Move you need the url and do a seperate API Call */
    var url: String
    //The name for this move resource
    var name: String
    
}



/* Model for the Location of Pokemon, I chose to add because on the FullView of a Pokemon I want users to be able too see in which game and where to find it */
struct LocationAreaEncounter {
    //On the API this is its own Object, I will only use the name to show it
    var location_area: String
    //On the API this is its own Object I will only use the version key to show string
    var version_details: String
}


enum Type: String {
    case Normal = "normal"
    case Psychic = "psychic"
    case Ground = "ground"
    case Rock = "rock"
    case Water = "water"
    case Fire = "fire"
    case Grass = "grass"
    case Bug = "bug"
    case Flying = "flying"
    case Poison = "poison"
    case Dragon = "dragon"
    case Dark = "dark"
    case Ghost = "ghost"
    case Electric = "electric"
    case Fighting = "fighting"
    case Steel = "steel"
    case Ice = "ice"
    case Fairy = "fairy"
}

extension Type {
    //Function to get ID of a Type we need for the API call 
    func getInt() -> Int {
        switch self {
        case .Normal: return 1
        case .Fighting: return 2
        case .Flying: return 3
        case .Ground: return 5
        case .Rock: return 6
        case .Water: return 11
        case .Fire: return 10
        case .Grass: return 12
        case .Bug: return 7
        case .Poison: return 4
        case .Dragon: return 16
        case .Dark: return 17
        case .Ghost: return 8
        case .Electric: return 13
        case .Psychic: return 14
        case .Steel: return 9
        case .Ice: return 15
        case .Fairy: return 18
            
        }
    }
    
    //Function to get color for the background Label of the Type
    func getColor() -> UIColor {
        switch self {
            //HEX: #A29E80
        case .Normal: return UIColor(red: 162/255, green: 158/255, blue: 128/255, alpha: 1.0)
        //HEX: #AD3729
        case .Fighting: return UIColor(red: 173/255, green: 55/255, blue: 41/255, alpha: 1.0)
            //Hex: 	#9D89D0
        case .Flying: return UIColor(red: 157/255, green: 137/255, blue: 208/255, alpha: 1.0)
            //HEX: #D7BC72
        case .Ground: return UIColor(red: 215/255, green: 188/255, blue: 114/255, alpha: 1.0)
            //HEX: #B59F37
        case .Rock: return UIColor(red: 181/255, green: 159/255, blue: 55/255, alpha: 1.0)
            //HEX: 	#6F8AE2
        case .Water: return UIColor(red: 11/255, green: 138/255, blue: 226/255, alpha: 1.0)
            //HEX: 	#EB8232
        case .Fire: return UIColor(red: 235/255, green: 130/255, blue: 50/255, alpha: 1.0)
            //HEX: #7ECD51
        case .Grass: return UIColor(red: 126/255, green: 205/255, blue: 81/255, alpha: 1.0)
            //Hex: #A8B915
        case .Bug: return UIColor(red: 168/255, green: 185/255, blue: 21/255, alpha: 1.0)
            //HEX: #994996
        case .Poison: return UIColor(red: 153/255, green: 73/255, blue: 150/255, alpha: 1.0)
            //Hex:	#653AD9
        case .Dragon: return UIColor(red: 101/255, green: 58/255, blue: 217/255, alpha: 1.0)
            //Hex: #73594B
        case .Dark: return UIColor(red: 115/255, green: 89/255, blue: 75/255, alpha: 1.0)
            //Hex: #6E5988
        case .Ghost: return UIColor(red: 110/255, green: 89/255, blue: 136/255, alpha: 1.0)
            //HEX: 	#DFD238
        case .Electric: return UIColor(red: 221/255, green: 210/255, blue: 56/255, alpha: 1.0)
            //Hex: #E76391
        case .Psychic: return UIColor(red: 231/255, green: 99/255, blue: 145/255, alpha: 1.0)
            //Hex: #B5B9D0
        case .Steel: return UIColor(red: 181/255, green: 185/255, blue: 208/255, alpha: 1.0)
            //HEX: #8DDADD
        case .Ice: return UIColor(red: 141/255, green: 218/255, blue: 221/255, alpha: 1.0)
            //Hex: 	#D9ABD4
        case .Fairy: return UIColor(red: 217/255, green: 171/255, blue: 212/255, alpha: 1.0)
            
        }
    }
    
    //Function to get ID of a Type we need for the API call
    func getBackGroundImage() -> UIImage {
        switch self {
        case .Normal: return #imageLiteral(resourceName: "normal")
        case .Fighting: return #imageLiteral(resourceName: "fighting")
        case .Flying: return #imageLiteral(resourceName: "flying")
        case .Ground: return #imageLiteral(resourceName: "ground")
        case .Rock: return #imageLiteral(resourceName: "rock")
        case .Water: return #imageLiteral(resourceName: "water")
        case .Fire: return #imageLiteral(resourceName: "fire")
        case .Grass: return #imageLiteral(resourceName: "grass")
        case .Bug: return #imageLiteral(resourceName: "bug")
        case .Poison: return #imageLiteral(resourceName: "poison")
        case .Dragon: return #imageLiteral(resourceName: "dragon")
        case .Dark: return #imageLiteral(resourceName: "dark")
        case .Ghost: return #imageLiteral(resourceName: "ghost")
        case .Electric: return #imageLiteral(resourceName: "electric")
        case .Psychic: return #imageLiteral(resourceName: "psychic")
        case .Steel: return #imageLiteral(resourceName: "steel")
        case .Ice: return #imageLiteral(resourceName: "ice")
        case .Fairy: return #imageLiteral(resourceName: "fairy")
            
        }
    }

}

extension PokemonAbility: Equatable, Hashable {
    static func ==(lhs: PokemonAbility, rhs: PokemonAbility) -> Bool {
        let areEqual = lhs.id == rhs.id
        return areEqual
    }
    
    var hashValue: Int {
        return self.id
    }

}

extension PokemonMove: Equatable, Hashable {
    
    static func ==(lhs: PokemonMove, rhs: PokemonMove) -> Bool {
        return lhs.name == rhs.name
    }
    
    var hashValue: Int {
        return self.name.characters.count
    }
}
