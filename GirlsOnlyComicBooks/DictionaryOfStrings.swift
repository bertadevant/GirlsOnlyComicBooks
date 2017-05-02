//
//  DictionaryOfStrings.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import Foundation

struct JSONKeys {
    
    /* Used for more than one object */
    static let id = "id"
    static let name = "name"
    
    
    /* Pokemon Specific */
    static let weight = "weight"
    static let is_default = "is_default"
    static let order = "order"
    static let sprites = "sprites"
    static let front_default = "front_default"
    static let pokemon = "pokemon"
    
    
    /* Abilities */
    static let abilities = "abilities"
    static let ability = "ability"
    static let slot = "slot"
    static let is_hidden = "is_hidden"
    
    
    /* Location*/
    static let location_area_encounters = "location_area_encounters"
    static let location_area = "location_area"
    static let version_details = "version_details"
    static let version = "version"
    
    /* Moves */
    static let moves = "moves"
    static let move = "move"
    static let url = "url"
    
    /* Type */
    static let type = "type"
    static let types = "types"
}


struct ViewControllerID {
    static let ResultsDetailViewController = "ResultsDetailViewController"
    static let ShowFilteredResultsVC = "ShowFilteredResultsVC"
    
}

struct Segues {
    
    static let containerTop25 = "topPokemonContainer"
    static let especificResultsContainer = "typeEspecificCollection"
    static let showFilteredResults = "showFilteredResultsVC"
    static let showFullDetails = "showFullDetailPokemon"
    
}

struct ReuseID {
    static let collectionCell = "collectionCell"
    static let catgeoryTypeCell = "catgeoryTypeCell"
}

struct NibNames {
    static let CollectionImageCell = "PokemonImageCollectionViewCell"
    static let CollectionCell = "PokemonCollectionViewCell"
    static let TypeCategoryCell = "TypeCategoryCollectionViewCell"
    static let DetailViewNib = "DetailPokemonView"
}
