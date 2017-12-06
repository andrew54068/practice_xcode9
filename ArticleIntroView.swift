//
//  ArticleIntroView.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/11/23.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class ArticleIntroView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var introTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ArticleIntroView", owner: self, options: nil)
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        //view.bounds = self.bounds
        //view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    convenience init(title:String?, time:String?, field:String?, views:String?) {
        self.init(frame: CGRect.zero)
        commonInit()
        
        introTitleLabel.text = title
        fieldLabel.text = field
        timeLabel.text = time
        viewsLabel.text = (views ?? "0") + " views"
    }
}
