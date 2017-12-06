//
//  RocheCollectionViewCell.swift
//  practice
//
//  Created by kidnapper on 09/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class SquareCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var patient: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var title: UILabel!
    
    var unreadIndication = UIImage(named: "unread")
    var attributedString: NSMutableAttributedString!
    
    var hadRead:Bool = false {
        willSet(newValue){
            if newValue{
                attributedString = nil
                self.title.attributedText = attributedString
            }else{
                let unreadDotAttachment = NSTextAttachment()
                unreadDotAttachment.image = UIImage(cgImage: unreadIndication!.cgImage!, scale: 3, orientation: .up)
                let attrStringWithImage = NSAttributedString(attachment: unreadDotAttachment)
                attributedString = attrStringWithImage as! NSMutableAttributedString
                self.title.attributedText = attributedString
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        translatesAutoresizingMaskIntoConstraints = false
        
        let unreadDotAttachment = NSTextAttachment()
        unreadDotAttachment.image = UIImage(cgImage: unreadIndication!.cgImage!, scale: 3, orientation: .up)
        let attrStringWithImage = NSAttributedString(attachment: unreadDotAttachment)
        attributedString = attrStringWithImage as! NSMutableAttributedString
        self.title.attributedText = attributedString
        
        self.thumbnail.layer.cornerRadius = 10
        self.thumbnail.clipsToBounds = true
    }
}
