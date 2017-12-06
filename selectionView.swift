//
//  selectionView.swift
//  practice
//
//  Created by kidnapper on 21/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class selectionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    @IBOutlet var betweenTwoConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var equalWidthConstraint: NSLayoutConstraint!
    
    
    
    @IBOutlet var left: UIButton!

    @IBOutlet var right: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateConstraint() {
        equalWidthConstraint.isActive = false
        right.isHidden = true
        DispatchQueue.main.async {
            self.betweenTwoConstraint.isActive = false
            self.layoutIfNeeded()
        }
    }
    
    
}
