//
//  ArticleViewController.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/11/20.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var backgroundScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func fakeData() -> [[String:AnyObject]] {
        let intro = ["title":"Primary analysis from OAK, a randomized phase III study comparing atezolizumab with docetaxel in Advanced NSCLC",
                     "time":"2017.10.20",
                     "field":"2017 ASCO / LC",
                     "views":"234"]
        let fakeData = [
            ["intro":intro],
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
        
        return fakeData as [[String : AnyObject]]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let data = fakeData()
        let v = ArticleContentViewController(contentArray: data)
        backgroundScrollView.addSubview(v.view)
        
        
        NSLayoutConstraint(item: v.view, attribute: .leading, relatedBy: .equal, toItem: backgroundScrollView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: v.view, attribute: .trailing, relatedBy: .equal, toItem: backgroundScrollView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: v.view, attribute: .top, relatedBy: .equal, toItem: backgroundScrollView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: v.view, attribute: .bottom, relatedBy: .equal, toItem: backgroundScrollView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: v.view, attribute: .width, relatedBy: .equal, toItem: backgroundScrollView, attribute: .width, multiplier: 1, constant: -30).isActive = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
