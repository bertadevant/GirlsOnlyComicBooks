//
//  TypeCategoryCollectionViewCell.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 5/1/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit

class TypeCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var typeName: UILabel!
    
    
    func setUpUIElements(type: Type) {
        
        //cell background
        self.backgroundColor = type.getColor()
        
        //Background Image
        backgroundImage.image = type.getBackGroundImage()
        backgroundImage.alpha = 0.5
        backgroundImage.contentMode = .scaleAspectFill
        
        //Name Label
        typeName.text = type.rawValue
        typeName.tintColor = .white
        typeName.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
        
    }
}
