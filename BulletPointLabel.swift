//
//  BulletPointLabel.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/11/23.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class BulletPointLabel: UILabel {
    override public var text: String? {
        didSet {
            setBullet()
        }
    }
    
    func setBullet() {
        let attributesDictionary:[String:Any] = [NSFontAttributeName : self.font]
        let fullAttributedString = NSMutableAttributedString(string: "", attributes: attributesDictionary)
        
        
        let bulletPoint: String = "\u{2022}"
        let formattedString: String = "\(bulletPoint) \(self.text!)\n"
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString)
        
        let paragraphStyle = createParagraphAttribute()
        attributedString.addAttributes([NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, attributedString.length))
        let rangeOfBulletPoint = attributedString.nsRangeOf(subString: bulletPoint)
        let rangeOfString = attributedString.nsRangeOf(subString: self.text!)
        
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.colorWith(Red: 185, Green: 209, Blue: 234, Alpha: 1), range: rangeOfBulletPoint)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.colorWith(Red: 74, Green: 74, Blue: 74, Alpha: 1), range: rangeOfString)
        attributedString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 14), range: rangeOfString)
        
        fullAttributedString.append(attributedString)
        
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
