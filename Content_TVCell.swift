//
//  Content_TVCell.swift
//  practice
//
//  Created by kidnapper on 20/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Content_TVCell: UITableViewCell {
//    let intro = ["title":"Primary analysis from OAK, a randomized phase III study comparing atezolizumab with docetaxel in Advanced NSCLC",
//                 "time":"2017.10.20",
//                 "field":"2017 ASCO / LC",
//                 "views":"234"]
    let fakeData = [
//        ["intro":["title":"Primary analysis from OAK, a randomized phase III study comparing atezolizumab with docetaxel in Advanced NSCLC",
//                  "time":"2017.10.20",
//                  "field":"2017 ASCO / LC",
//                  "views":"234"]],
        ["contentSmall":"Fabrice Barlesi, Keunchil Park, Fortunato Ciardiello, Joachim von Pawel, Shirish Gadgeel, Toyoaki Hida, Dariusz Kowalski, Manuel Cobo Dols, Diego Cortinovis, Joseph Leach, Jonathan Polikoff, David R. Gandara, Carlos Barrios, Daniel Chen, Pei He, Marcin Kowanetz, Marcus Ballinger, Daniel Waterkamp, Alan Sandler, Achim Rittmeyer"],
        ["contentSmall":"Fabrice Barlesi, Keunchil Park, Fortunato Ciardiello, Joachim von Pawel, Shirish Gadgeel, Toyoaki Hida, Dariusz Kowalski, Manuel Cobo Dols, Diego Cortinovis, Joseph Leach, Jonathan Polikoff, David R. Gandara, Carlos Barrios, Daniel Chen, Pei He, Marcin Kowanetz, Marcus Ballinger, Daniel Waterkamp, Alan Sandler, Achim Rittmeyer"],
        ["paragraphTitle":"Background"],
        ["quote":"Atezolizumab (anti–PD-L1) is an engineered mAb that inhibits the PD-L1/PD-1 and PD-L1/B7.1 interactions to restore anti-tumor T-cell activity and enhance T-cell priming1,2"],
        ["quote":"In previously treated NSCLC, atezolizumab improved OS vs docetaxel in the randomized Phase II POPLAR study (median OS 12.6 vs 9.7 mo; HR = 0.69)3,4"],
        ["quote":"The data from OAK are the first Phase III results for a PD-L1-directed antibody"],
        ["paragraphTitle":"Phase III OAK study design"],
        ["paragraphSubtitle":"Primary Endpoints (first 850 enrolled patients) :"],
        ["quote":"OS in the ITT population"],
        ["quote":"OS in patients with PD-L1 expression on ≥ 1% TC or IC"],
        ["paragraphTitle":"A more meaningful life"],
        ["contentDefault":"Today, Dee’s life after cancer looks very different from her life before. She quit her job in New Jersey and moved to be with her daughter and granddaughter in Maryland. She found an interesting new position as an executive assistant for a famous judge in Washington, DC. She started Y-U Breast Cancer Foundation Inc. to raise funds for women with breast cancer. She became a breast cancer patient advocate and public speaker. She’s even about to release a song she wrote called “It’s All About Me” – a funk-blues empowerment anthem for women with breast cancer."],
        ["bullet":"Amber"],
        ["bullet":"Paul"],
        ["bullet":"Mike"]
        
    ]


    var vc:ArticleContentViewController? = nil
    let test = "Teams from several countries have intensified their efforts in the South Atlantic to find the ARA San Juan submarine, which vanished on Wednesday.The US Navy has sent a second ship with special tracking equipment and deep-sea rescue modules to join the search.The vessel disappeared 430km (267 miles) off the Argentine coast.On Saturday, several satellite signals thought to have come from the sub were detected near the Valdez peninsula.A Nasa research plane was used an attempt to trace the location but was unsuccessful.Rescue teams have also been hindered by heavy winds and high waves.Teams from several countries have intensified their efforts in the South Atlantic to find the ARA San Juan submarine, which vanished on Wednesday.The US Navy has sent a second ship with special tracking equipment and deep-sea rescue modules to join the search.The vessel disappeared 430km (267 miles) off the Argentine coast.On Saturday, several satellite signals thought to have come from the sub were detected near the Valdez peninsula.A Nasa research plane was used an attempt to trace the location but was unsuccessful.Rescue teams have also been hindered by heavy winds and high waves.Teams from several countries have intensified their efforts in the South Atlantic to find the ARA San Juan submarine, which vanished on Wednesday.The US Navy has sent a second ship with special tracking equipment and deep-sea rescue modules to join the search.The vessel disappeared 430km (267 miles) off the Argentine coast.On Saturday, several satellite signals thought to have come from the sub were detected near the Valdez peninsula.A Nasa research plane was used an attempt to trace the location but was unsuccessful.Rescue teams have also been hindered by heavy winds and high waves."
    
//    @IBOutlet var contentLabel: UILabel!
    
    var displayView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

//        contentLabel.backgroundColor = UIColor.red
//        contentLabel.text = test
//        contentLabel.numberOfLines = 0
//        contentLabel.lineBreakMode = .byWordWrapping
//        print("123")
        vc = ArticleContentViewController(contentArray: fakeData as [[String : AnyObject]])
        
//        self.contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        self.contentView.addSubview(vc!.view)
        
        NSLayoutConstraint(item: vc!.view, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: vc!.view, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -30).isActive = true
        NSLayoutConstraint(item: vc!.view, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: vc!.view, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: vc!.view, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1, constant: -30).isActive = true
    }
    
    
}
