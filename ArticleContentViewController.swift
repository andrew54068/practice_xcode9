//
//  ArticleContentViewController.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/11/21.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class ArticleContentViewController: UIViewController {
    var _sourceArray = [[String:AnyObject]]()
    var lastAnchorView:UIView? = nil
    var isLastObject:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(contentArray:[[String:AnyObject]]) {
        super.init(nibName: nil, bundle: nil)
        _sourceArray = contentArray
        self.view.translatesAutoresizingMaskIntoConstraints = false
        parseSourceArray()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func parseSourceArray() {
        for (index, obj) in _sourceArray.enumerated() {
            if index == (_sourceArray.count - 1) {
                isLastObject = true
            }
            for (key, _) in obj {
                switch key as! String {
                    case "intro":
                        setupIntro(obj: obj)
                    case "contentDefault":
                        setupContentDefault(obj: obj)
                    case "contentSmall":
                        setupContentSmall(obj: obj)
                    case "paragraphTitle":
                        setupParagraphTitle(obj: obj)
                    case "paragraphSubtitle":
                        setupParagraphSubtitle(obj: obj)
                    case "imageCaption":
                        setupImageCaption(obj: obj)
                    case "quote":
                        setupQuote(obj: obj)
                    case "img":
                        setupImage(obj: obj)
                    case "bullet":
                        setBulletPoint(obj: obj)
                default:
                    break
                }
            }
        }
    }
    
    func setBulletPoint(obj:[String:AnyObject]) {
        let bullet = BulletPointLabel(frame: CGRect.zero)
        bullet.text = obj["bullet"] as! String
        setupConstraints(constraintView: bullet)
    }
    
    func setupIntro(obj:[String:AnyObject]) {
        let fake = obj["intro"]
        let introView = ArticleIntroView(title: fake?["title"] as? String, time: fake?["time"] as? String, field: fake?["field"] as? String, views: fake?["views"] as? String)
        /*
        introView.introTitleLabel.text = fake?["title"] as? String
        introView.fieldLabel.text = fake?["field"] as? String
        introView.timeLabel.text = fake?["time"] as? String
        introView.viewsLabel.text = fake?["views"] as? String
        */
        setupConstraints(constraintView: introView)
    }
    
    func setupContentDefault(obj:[String:AnyObject]) {
        let contentLabel = UILabel()
        contentLabel.text = obj["contentDefault"] as? String
        contentLabel.font = UIFont(name: contentLabel.font.fontName, size: 14)
        contentLabel.textColor = UIColor.colorWith(Red: 74, Green: 74, Blue: 74, Alpha: 1)
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        setupConstraints(constraintView: contentLabel)
    }
    
    func setupContentSmall(obj:[String:AnyObject]) {
        let contentLabel = UILabel()
        contentLabel.text = obj["contentSmall"] as? String
        contentLabel.font = UIFont(name: contentLabel.font.fontName, size: 13)
        contentLabel.textColor = UIColor.colorWith(Red: 155, Green: 155, Blue: 155, Alpha: 1)
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        setupConstraints(constraintView: contentLabel)
    }
    
    func setupParagraphTitle(obj:[String:AnyObject]) {
        let titleLabel = UILabel()
        titleLabel.text = obj["paragraphTitle"] as? String
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        setupConstraints(constraintView: titleLabel)
    }
    
    func setupParagraphSubtitle(obj:[String:AnyObject]) {
        let subtitleLabel = UILabel()
        subtitleLabel.text = obj["paragraphSubtitle"] as? String
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        subtitleLabel.textColor = UIColor.colorWith(Red: 49, Green: 105, Blue: 161, Alpha: 1)
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 0
        setupConstraints(constraintView: subtitleLabel)
    }
    
    func setupImageCaption(obj:[String:AnyObject]) {
        let captionLabel = UILabel()
        captionLabel.text = obj["imageCaption"] as? String
        captionLabel.font = UIFont.systemFont(ofSize: 10)
        captionLabel.textColor = UIColor.gray
        captionLabel.textAlignment = .left
        captionLabel.numberOfLines = 0
        setupConstraints(constraintView: captionLabel)
    }
    
    func setupDescription(obj:[String:AnyObject]) {
        let descriptionLabel = UILabel()
        descriptionLabel.text = obj["description"] as? String
        descriptionLabel.font.withSize(12)
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        setupConstraints(constraintView: descriptionLabel)
    }
    
    func setupQuote(obj:[String:AnyObject])  {
        let quote = ArticleQuoteView()
        //quote.setQuoteContent(contentString: obj["quote"] as! String)
        
        quote.text = obj["quote"] as? String
        quote.font = UIFont.italicSystemFont(ofSize: 17)
        quote.textColor = UIColor.colorWith(Red: 74, Green: 74, Blue: 74, Alpha: 1)
        setupConstraints(constraintView: quote)
    }
    
    func setupImage(obj:[String:AnyObject]) {
        let contentImageView = UIImageView()
        // image may download from url
        contentImageView.image = obj["img"] as? UIImage
        contentImageView.contentMode = .scaleAspectFit
        setupConstraints(constraintView: contentImageView)
    }
    
    func setupConstraints(constraintView:UIView) {
        constraintView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(constraintView)
        NSLayoutConstraint(item: constraintView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: constraintView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 15).isActive = true
        //NSLayoutConstraint(item: constraintView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .notAnAttribute, multiplier: 1, constant: 300).isActive = true
        if lastAnchorView == nil {
            // first view to add
            NSLayoutConstraint(item: constraintView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 10).isActive = true
        }
        else {
            NSLayoutConstraint(item: constraintView, attribute: .top, relatedBy: .equal, toItem: lastAnchorView, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        }
        
        if isLastObject {
            // add bottom constraint
            NSLayoutConstraint(item: constraintView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        }
        else {
            // constraintView should be set as lastAnchorView for next view's constraint
            lastAnchorView = constraintView
        }
        
        self.view.layoutIfNeeded()
    }

}
