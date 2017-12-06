//
//  RocheCollectionViewCell2.swift
//  practice
//
//  Created by kidnapper on 15/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {


    @IBOutlet var rectangleImage: UIImageView!
    @IBOutlet var rectangleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        rectangleImage.layer.cornerRadius = 10
        rectangleImage.clipsToBounds = true
    }
}
