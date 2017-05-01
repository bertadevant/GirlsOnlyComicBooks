//
//  TopResultsViewController.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/30/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit

class TopResultsViewController: UIViewController {

    @IBOutlet weak var pokemonLogo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonLogo.image = #imageLiteral(resourceName: "pokemonLogo")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
