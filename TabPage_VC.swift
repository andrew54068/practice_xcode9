////
////  ViewController.swift
////  practice
////
////  Created by kidnapper on 06/11/2017.
////  Copyright © 2017 kidnapper.com. All rights reserved.
////
//
//import UIKit
//import Foundation
//import TabPageViewController
//
////protocol TabPageController: class {
////    func showTabPageVC()
////}
//
//class TabPage_VC: UIPageViewController {
//    
////    var delegate: TabPageController?
//    
////    override func loadView() {
////        let CongressUpdate = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CongressUpdate_VC")
////        let ExpertCommentary = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertCommentary_VC")
////        let Event = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Event_VC")
////        let TrailFactSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TrailFactSheet_VC")
////        let Bookmark = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Bookmark_VC")
////        self.tabItems = [(CongressUpdate, "CongressUpdate"), (ExpertCommentary, "ExpertCommentary"), (Event, "Event"), (TrailFactSheet, "TrailFactSheet"), (Bookmark, "Bookmark")]
////    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        
//        showTabPageVC()
//        
////        var option = TabPageOption()
////        option.tabWidth = view.frame.width / CGFloat(tc.tabItems.count)
////        option.hidesTopViewOnSwipeType = .all
////        tc.option = option
////        tc.view.frame = CGRect(x: 20, y: 44, width: tc.view.frame.width, height: tc.view.frame.height - 44)
////        tc.viewWillLayoutSubviews()
////        tc.view.setNeedsLayout()
////        tc.view.layoutIfNeeded()
////        present(tc, animated: false, completion: nil)
////        print("succeed")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        tableView.delegate = self
////        tableView.dataSource = self
////        tableView.backgroundColor = UIColor.brown
////        tableView.separatorColor = UIColor.gray
////        let sb = UIStoryboard(name: "TabPageViewController", bundle: Bundle(for: TabPageViewController.self))
////        self = sb.instantiateInitialViewController() as! TabPageViewController
//    }
//    
//    func showTabPageVC(){
//        let tc = TabPageViewController.create()
//        let CongressUpdate = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CongressUpdate_VC")
//        let ExpertCommentary = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertCommentary_VC")
//        let Event = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Event_VC")
//        let TrailFactSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TrailFactSheet_VC")
//        let Bookmark = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Bookmark_VC")
//        
////        let logo = UIImage(named: "Roche_logo")
////        let logoView = UIImageView(image: logo)
////        navigationItem.titleView = logoView
//        
//        tc.tabItems = [(CongressUpdate, "CongressUpdate"), (ExpertCommentary, "ExpertCommentary"), (Event, "Event"), (TrailFactSheet, "TrailFactSheet"), (Bookmark, "Bookmark")]
//        
//        
////        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
////        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "mainVC") as! UITabBarController
////        UIApplication.shared.keyWindow?.rootViewController = viewController
//        
//        
//        present(tc, animated: false, completion: nil)
//    }
//    
////    override func viewWillAppear(_ animated: Bool) {
////        
////        
////    }
//    
////    //MARK:- tableView delegate
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 3
////    }
////    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
////        
////        cell.layer.backgroundColor = UIColor.green.cgColor
////        cell.backgroundColor = UIColor.blue
////        cell.separatorInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
////        return cell
////    }
////    
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        
////        return 278
////    }
//
//    
//}
//
