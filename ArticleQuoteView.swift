//
//  ArticleQuoteView.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/11/24.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class ArticleQuoteView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet private weak var quoteLabel: UILabel!
    var font:UIFont? = UIFont.italicSystemFont(ofSize: 17) {
        didSet (value) {
            quoteLabel.font = value
        }
    }
    
    var textColor:UIColor = UIColor.gray {
        didSet (value) {
            quoteLabel.textColor = value
        }
    }
    
    var text:String? = "" {
        didSet (value) {
            quoteLabel.text = text
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ArticleQuoteView", owner: self, options: nil)
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true

        //view.bounds = self.bounds
        //view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    public func setQuoteContent(contentString:String) {
        quoteLabel.text = contentString
    }
}
