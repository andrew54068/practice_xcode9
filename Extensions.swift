//
//  Extensions.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/11/23.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    func rangeOf(subString: String) -> Range<String.Index>? {
        return self.string.range(of: subString)
    }
    
    func nsRangeOf(subString: String) -> NSRange {
        let range = self.string.range(of: subString)
        return self.string.nsRange(fromRange: range!)
    }
}

extension String {
    func nsRange(fromRange range: Range<Index>) -> NSRange {
        let from = range.lowerBound
        let to = range.upperBound
        
        let location = characters.distance(from: startIndex, to: from)
        let length = characters.distance(from: from, to: to)
        
        return NSRange(location: location, length: length)
    }
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

extension UIColor {
    class func colorWith(Red red:Float, Green green:Float, Blue blue:Float, Alpha alpha:Float) -> UIColor {
        return UIColor(colorLiteralRed: Float(red/255), green: Float(green/255), blue: Float(blue/255), alpha: alpha)
    }
    
    static func wordingGray() -> UIColor {
        return UIColor(colorLiteralRed: Float(155.0/255.0), green: Float(155.0/255.0), blue: Float(155.0/255.0), alpha: 1)
    }
    
    static func wordingBlack() -> UIColor {
        return UIColor(colorLiteralRed: Float(74.0/255.0), green: Float(74.0/255.0), blue: Float(74.0/255.0), alpha: 1)
    }
    
    static func rocheBlue() -> UIColor {
        return UIColor(colorLiteralRed: Float(0.0/255.0), green: Float(102.0/255.0), blue: Float(204.0/255.0), alpha: 1)
    }
    
    static func rocheRed() -> UIColor {
        return UIColor(colorLiteralRed: Float(204.0/255.0), green: Float(0.0/255.0), blue: Float(51.0/255.0), alpha: 1)
    }
    
    static func textfieldBackgroundGray() -> UIColor {
        return UIColor(colorLiteralRed: Float(247.0/255.0), green: Float(249.0/255.0), blue: Float(250.0/255.0), alpha: 1)
    }
}

extension CALayer {
    var borderUIColor: UIColor {
        set {
            self.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: self.borderColor!)
        }
    }
}
