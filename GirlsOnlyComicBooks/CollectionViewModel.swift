//
//  CollectionViewModel.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import Foundation
import RxSwift

class CollectionViewModel {
    /* To create the  list of the Top Pokemon we show at the beginning I am using this list: http://www.dorkly.com/post/57679/toplist-results-the-25-greatest-pokemon-of-all-time and hardcoding it in the API as a form of an Array of Strings */
    let top25Pokemon: [Int] = [93, 143, 245, 144, 376, 145, 123, 197, 244,
                                         212, 257, 248, 130, 448, 065, 157 ,384,
                                         149, 059, 249, 094, 151, 009, 150, 006]
    
    let baseURLForAPi = "http://pokeapi.co/api/v2/"

    //The view controller will subscribe to this variable and we will add pokemon as soon as we get them from the server
    var currentPokemon: Variable<[Pokemon]> = Variable([])
    //This variable holds the ID of the pokemon we are going to show onto the collection, since we can get 100 pokemon at once per type we will only show 10 at the time and remove those ID from the Array.
    var pokemonIDQueque: [Int] = []
    
    
    /* How the API works I do not get an array of results, so for the first 25 top I hard coded those into an array but for the categories one filtered by type of Pokemon I will have to call API for specific type and get the list of Pokemon that have that type. Then get those ID and with that call the method getCollectionPokemon */
    
    func findURLPokemonToShow(pokemonType: Type?) {
        
        guard let pokemonType = pokemonType else {
            //if there is no type we show the top 25
            getCollectionPokemon(urlArray: top25Pokemon)
            return
        }
        
        let url = "\(baseURLForAPi)type/\(pokemonType.getInt())"
        //we call the API by the type and get all the pokemon inside that type
        AlamoFireHandler.getDataFromAPI(url: url) { [unowned self] json, error in
            guard let json = json else { return }
            self.pokemonIDQueque = JsonParser.getPokemonIDFromArray(json: json)
            //after we have all the pokemons of this type we pass on the first 10 and take them out of the array
            let firstPokemon = self.pokemonIDQueque[0..<10]
            let arrayToPass = Array(firstPokemon)
            self.getCollectionPokemon(urlArray: arrayToPass)
            //We remove the first 10 while the API makes the calls
            for int in 0...firstPokemon.count{
                self.pokemonIDQueque.remove(at: int)
            }
        }
        
    }

    
    //Function adds to the Variable the View Controller is subscribed to
    private func getCollectionPokemon(urlArray: [Int])  {
        
        for id in urlArray {
            let url = "\(baseURLForAPi)pokemon/\(id)"
            AlamoFireHandler.getDataFromAPI(url: url) { json, error in
                guard let json = json else { return }
                let pokemon = JsonParser.parsePokemonObject(json: json)
                self.currentPokemon.value.append(pokemon)
            }
        }
        
    }
    
    
    
}


