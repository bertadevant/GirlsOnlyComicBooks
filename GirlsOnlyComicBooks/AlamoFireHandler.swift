//
//  AlamoFireHandler.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamoFireHandler {
    
    class func getDataFromAPI(url: String, completionHandler: @escaping (JSON?, NSError?) -> ()) {
        
        Alamofire.request(url).validate()
            .responseJSON { response in
                switch response.result {
                case .success (let data):
                    let jsonData = JSON(data)
                    completionHandler(jsonData, nil)
                case .failure(let error):
                    print("Error getting data from API: \(error)")
                    completionHandler(nil, error as NSError?)
                }
        }
        
    }
    
}
