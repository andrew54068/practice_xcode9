//
//  Reference_TVCell.swift
//  practice
//
//  Created by kidnapper on 20/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Reference_TVCell: UITableViewCell {

    var isEvent:Bool = false{
        didSet{
            if isEvent == true{
                schedule.isHidden = false
                share.isHidden = true
                bookmark.isHidden = true
            }
            else{
                schedule.isHidden = true
                share.isHidden = false
                bookmark.isHidden = false
            }
        }
    }
    
    @IBOutlet var ReferenceContent: ReferenceLabel!
    
    @IBOutlet var bookmark: UIButton!
    
    @IBOutlet var share: UIButton!
    
    @IBOutlet var schedule: UIButton!

    
    @IBAction func addToSchedule(_ sender: Any) {
    }
    
    @IBAction func shareClicked(_ sender: Any) {
    }
    
    @IBAction func addToBookmark(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        schedule.isHidden = false
        share.isHidden = true
        bookmark.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
