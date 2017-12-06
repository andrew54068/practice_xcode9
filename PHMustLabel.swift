//
//  PHMustLabel.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/12/4.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class PHMustLabel: UILabel {

    override var text: String? {
        didSet (newValue) {
            setImportantMark(text: newValue)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImportantMark(text: nil)
    }

    func setImportantMark(text:String?) {
        let newText = text ?? self.text
        let attributesDictionary:[String:Any] = [NSFontAttributeName : self.font]
        let fullAttributedString = NSMutableAttributedString(string: "", attributes: attributesDictionary)
        
        
        let importantMark: String = "*"
        let formattedString: String = "\(newText!) \(importantMark)"
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString)
        
        let paragraphStyle = createParagraphAttribute()
        attributedString.addAttributes([NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, attributedString.length))
        let rangeOfMark = attributedString.nsRangeOf(subString: importantMark)
        let rangeOfString = attributedString.nsRangeOf(subString: newText!)
        
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.rocheBlue(), range: rangeOfMark)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.wordingGray(), range: rangeOfString)
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
