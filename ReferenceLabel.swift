//
//  ReferenceLabel.swift
//  practice
//
//  Created by kidnapper on 05/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class ReferenceLabel: UILabel {
    
    var textArray:[String] = [String]() {
        didSet {
            setBullet()
        }
    }

    override public var text: String? {
        didSet {
            setBullet()
        }
    }
    
    func setBullet() {
        let attributesDictionary:[String:Any] = [NSFontAttributeName : self.font]
        let fullAttributedString = NSMutableAttributedString(string: "", attributes: attributesDictionary)
        
        for (index, value) in textArray.enumerated() {
            
            let bulletPoint: String = "\(index + 1)."
            let formattedString: String = "\(bulletPoint) \(value)\n"
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString)
            
            let paragraphStyle = createParagraphAttribute()
            attributedString.addAttributes([NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, attributedString.length))
            let rangeOfBulletPoint = attributedString.nsRangeOf(subString: bulletPoint)
            let rangeOfString = attributedString.nsRangeOf(subString: value)
            
            attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.wordingBlack() , range: rangeOfBulletPoint)
            attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.wordingBlack(), range: rangeOfString)
            attributedString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 14), range: rangeOfString)
            
            fullAttributedString.append(attributedString)
            
            
        }
        self.attributedText = fullAttributedString
    }
    
    func createParagraphAttribute() ->NSParagraphStyle
    {
        var paragraphStyle: NSMutableParagraphStyle
        paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15, options: NSDictionary() as! [String : AnyObject])]
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 15
        
        return paragraphStyle
    }

}
