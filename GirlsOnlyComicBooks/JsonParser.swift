//
//  JsonParser.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import Foundation
import SwiftyJSON

/* JSON parser class with static funcions that will be used to parse the JSON coming from Alamofire */

class JsonParser {
    
    class func parsePokemonObject(json: JSON) -> Pokemon {
        
        let abilities = JsonParser.getAbilitiesSet(json: json)
        let moves = JsonParser.getMovesSet(json: json)
        let locations = JsonParser.getLocationAreasArray(json: json)
        let types = JsonParser.getTypesArray(json: json)
        
        let newPokemon = Pokemon(
            id: json[JSONKeys.id].intValue,
            name: json[JSONKeys.name].stringValue,
            is_default: json[JSONKeys.is_default].boolValue,
            order: json[JSONKeys.order].intValue,
            weight: json[JSONKeys.weight].intValue,
            abilities: abilities,
            moves: moves,
            location_area_encounters: locations,
            type: types,
            sprites: json[JSONKeys.sprites][JSONKeys.front_default].stringValue)
        
        return newPokemon
        
    }
    
    class func getAbilitiesSet(json: JSON) -> Set<PokemonAbility> {
        
        var set =  Set<PokemonAbility>()
        
        for jsonArray in json[JSONKeys.abilities].arrayValue {
            let newAbility = PokemonAbility(
                id: jsonArray[JSONKeys.ability][JSONKeys.id].intValue,
                name: jsonArray[JSONKeys.ability][JSONKeys.name].stringValue,
                slot: jsonArray[JSONKeys.slot].intValue,
                is_hidden: jsonArray[JSONKeys.is_hidden].boolValue)
            set.insert(newAbility)
        }
        
        return set
    }
    
    class func getMovesSet(json: JSON ) -> Set<PokemonMove> {
        
        var set = Set<PokemonMove>()
        for jsonArray in json[JSONKeys.moves].arrayValue {
            let move = PokemonMove(
                url: jsonArray[JSONKeys.move][JSONKeys.url].stringValue,
                name: jsonArray[JSONKeys.move][JSONKeys.name].stringValue)
            set.insert(move)
        }
        
        return set
        
    }
    
    class func getLocationAreasArray(json: JSON) -> [LocationAreaEncounter] {
        
        var locations: [LocationAreaEncounter] = []
        for jsonArray in json[JSONKeys.location_area_encounters].arrayValue {
            let location = LocationAreaEncounter(
                location_area: jsonArray[JSONKeys.location_area][JSONKeys.name].stringValue,
                version_details: jsonArray[JSONKeys.version_details][JSONKeys.version][JSONKeys.name].stringValue)
            locations.append(location)
        }
        return locations
        
    }
    
    
    class func getTypesArray(json: JSON) -> [Type] {
        
        var types: [Type] = []
        
        for jsonArray in json[JSONKeys.types].arrayValue {
            guard let type = Type(rawValue: jsonArray[JSONKeys.type][JSONKeys.name].stringValue) else { continue }
            types.append(type)
        }
        return types
    }
    
    class func getPokemonIDFromArray(json: JSON) -> [Int] {
        
        var idArray: [Int] = []
        
        for jsonArray in json[JSONKeys.pokemon].arrayValue {
            var urlOfPokemon = jsonArray[JSONKeys.pokemon][JSONKeys.url].stringValue
            let url = urlOfPokemon.remove(at: urlOfPokemon.characters.count)
            guard let number = url.components(separatedBy: "/").last else { return [] }
            guard let num = Int(number) else { return [] }
            idArray.append(num)
        }
        
        return idArray
        
    }
}
