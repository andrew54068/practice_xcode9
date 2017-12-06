//
//  Quiz_TVCell.swift
//  practice
//
//  Created by kidnapper on 20/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Quiz_TVCell: UITableViewCell {

    @IBOutlet var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        question.text = "Gender disparity in the rate of partner abandonment in patients with serious medical illness?"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
