//
//  ComicBookModels.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import Foundation

/*This was supposed to be a structure that created ComicBook Objects but since the Marvel API is not currently Working I had to use the POKEMON API you can find here http://pokeapi.co/ */

/* Since the Marvel API is not working right now I created an ObjectsFromAPI protocol, two struct will inherit from this object: Pokemon and ComicBook; that way in case the API starts working at some point I can just change which object I shown without having to refactor the code */
protocol ObjectsFromAPI {
    var id: Int { get }
    var name: String { get set }
    
    
}

/* Original Model I was planning on using for the MARVEL API */
struct ComicBook: ObjectsFromAPI {
    var id: Int
    var name: String
    
}

