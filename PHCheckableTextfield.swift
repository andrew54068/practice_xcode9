//
//  PHCheckableTextfield.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/12/4.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

public enum WarningType:Int {
    case none, correct, warning
}

@IBDesignable class PHCheckableTextfield: UITextField {
    
    @IBInspectable var warningImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var correctImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var warningType:WarningType = .none {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        updateView()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    
    func updateView() {
        self.backgroundColor = UIColor.textfieldBackgroundGray()
        
        switch warningType {
        case .none:
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
            self.layer.borderWidth = 0
            self.layer.borderUIColor = UIColor.clear
            self.borderStyle = .none
        case .correct:
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = correctImage
            rightView = imageView
            self.layer.borderWidth = 0
            self.layer.borderUIColor = UIColor.clear
        case .warning:
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = warningImage
            rightView = imageView
            self.layer.borderWidth = 1
            self.layer.borderUIColor = UIColor.rocheRed()
     
        }
        
    }
    
}
