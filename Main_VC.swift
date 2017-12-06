
//
//  CollectionViewController.swift
//  practice
//
//  Created by kidnapper on 09/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

//protocol openArticle: class {
//    func showArticle()
//}

class Main_VC: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    private let SquareCellId = "SquareCategoryCell"
    private let BannerCellId = "BannerCategoryCell"
    private let segueId = "seeAll"
    var titleContent: String = ""
    var subtitleContent: String = ""
//    var attributedString: NSMutableAttributedString!
    var numberOfRowBeforeSqueezedRectangle:Int = 2
//    weak var delegate: openArticle?
    
    @IBOutlet var navigationBar: NavigationBar!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        let SquareNib = UINib(nibName: "SquareCategoryCell", bundle: nil)
        collectionView!.register(SquareNib, forCellWithReuseIdentifier: SquareCellId)
        
        let BannerNib = UINib(nibName: "BannerCategoryCell", bundle: nil)
        collectionView!.register(BannerNib, forCellWithReuseIdentifier: BannerCellId)
        
//        let image = UIImage(named: "icon_btn_arrow_blue")
//        
//        navigationController?.navigationBar.backIndicatorImage = image
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //wait for angie
        /*let logo = UIImage(named: "Roche_logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView*/
        
        setUpNavigationBar()
        
        // -Paul
        
        let storyboard = UIStoryboard(name: "PaulMain", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! UINavigationController
        self.present(login, animated: false, completion: nil)
    }
    
    func setUpNavigationBar(){
        
        //right NavItem
//        let flexible = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        //        fix.width = -3
        let sr = UIButton.init(type: .custom)
        sr.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
        sr.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        sr.setImage(UIImage(named: "icon_btn_search_default"), for: .normal)
        let search = UIBarButtonItem(customView: sr)
        
        let bm = UIButton.init(type: .custom)
        bm.frame = CGRect(x: 0, y: 0, width: 20, height: 26)
        bm.addTarget(self, action: #selector(handleBookmark), for: .touchUpInside)
        bm.setImage(UIImage(named: "icon_btn_bookmark_default"), for: .normal)
        let bookmark = UIBarButtonItem(customView: bm)
        
        let mn = UIButton()
        mn.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
        mn.addTarget(self, action: #selector(handleMenu), for: .touchUpInside)
        mn.setImage(UIImage(named: "icon_btn_menu_default"), for: .normal)
        let menu = UIBarButtonItem(customView: mn)
        let fix = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        fix.width = -3
        navigationItem.rightBarButtonItems = [fix, menu, bookmark, search]
    }
    //MARK: left navigation item action
    func handleMenu(){
        print("show menu")
    }
    
    //MARK: right navigation item action
    func handleSearch(){
//        let storyboard = UIStoryboard(name: "TabPageViewController", bundle: Bundle(for: TabPageViewController.self))
//        let storyboard = UIStoryboard(name: "Search_TPVC", bundle: nil)
//        let search_TPVC: Search_TPVC = storyboard.instantiateInitialViewController() as! Search_TPVC
//            as! Search_TPVC
        let search_TPVC = Search_TPVC()
        
        let result_TVC_All = Search_TVC()
        let result_TVC_CongressUpdate = Search_TVC()
        let result_TVC_ExpertCommentary = Search_TVC()
        let result_TVC_Event = Search_TVC()
        let result_TVC_TrailFactSheet = Search_TVC()
        let result_TVC_Bookmark = Search_TVC()
        
        let grayColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
        let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: grayColor ]
        let all_text = NSMutableAttributedString(string: "ALL", attributes: attrs)
        let congressUpdate_text = NSMutableAttributedString(string: "CONGRESS UPDATE", attributes: attrs)
        let expertCommentary_text = NSMutableAttributedString(string: "EXPERT COMMENTARY", attributes: attrs)
        let event_text = NSMutableAttributedString(string: "EVENT", attributes: attrs)
        let trailFactSheet_text = NSMutableAttributedString(string: "TRAIL FACT SHEET", attributes: attrs)
        
        let bookmarkAttachment = NSTextAttachment()
        let bookmarkImage = UIImage(named: "icon_btn_bookmark_default")!.withRenderingMode(.alwaysTemplate)
        bookmarkAttachment.image = bookmarkImage
        bookmarkAttachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 16)
        
        let attrStringWithImage: NSAttributedString = NSAttributedString(attachment: bookmarkAttachment)
        let bookMarktext = NSMutableAttributedString(string: " BOOKMARK", attributes: attrs)
        let empty = NSMutableAttributedString(string: " ", attributes: attrs)
        empty.append(attrStringWithImage)
        empty.append(bookMarktext)
        let bookMark_text = empty
        
        search_TPVC.tabItems = [(result_TVC_All, all_text), (result_TVC_CongressUpdate, congressUpdate_text), (result_TVC_ExpertCommentary, expertCommentary_text), (result_TVC_Event, event_text), (result_TVC_TrailFactSheet, trailFactSheet_text), (result_TVC_Bookmark, bookMark_text)]
        
        //?? below not as expected!
        navigationController?.pushViewController(search_TPVC, animated: true)
        print("search being called")
    }
    
    func handleBookmark(){
        print("show bookmark")
    }
    
    func seeAll(){
        let tc = SeeAllViewController.create()
        let CongressUpdate = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CongressUpdate_VC")
        let ExpertCommentary = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertCommentary_VC")
        let Event = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Event_VC")
        let TrailFactSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TrailFactSheet_VC")
        let Bookmark = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Bookmark_VC")
        
        let grayColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
        let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: grayColor ]
        let CongressUpdate_text = NSMutableAttributedString(string: "Congress Update", attributes: attrs)
        let ExpertCommentary_text = NSMutableAttributedString(string: "Expert Commentary", attributes: attrs)
        let Event_text = NSMutableAttributedString(string: "Event", attributes: attrs)
        let TrailFactSheet_text = NSMutableAttributedString(string: "Trail Fact Sheet", attributes: attrs)
        
        let bookmarkAttachment = NSTextAttachment()
        let bookmarkImage = UIImage(named: "icon_btn_bookmark_default")!.withRenderingMode(.alwaysTemplate)
        bookmarkAttachment.image = bookmarkImage
        bookmarkAttachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 16)
        
        let attrStringWithImage: NSAttributedString = NSAttributedString(attachment: bookmarkAttachment)
        let BookMarktext = NSMutableAttributedString(string: " Bookmark", attributes: attrs)
        let empty = NSMutableAttributedString(string: " ", attributes: attrs)
        empty.append(attrStringWithImage)
        empty.append(BookMarktext)
        let BookMark_text = empty
        
        tc.tabItems = [(CongressUpdate, CongressUpdate_text), (ExpertCommentary, ExpertCommentary_text), (Event, Event_text), (TrailFactSheet, TrailFactSheet_text), (Bookmark, BookMark_text)]
        
        self.navigationController?.pushViewController(tc, animated: true)
//        self.performSegue(withIdentifier: "seeAll", sender: self)
    }
    
    func showArticle(){
        var Article = Article_TVC()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        Article = storyBoard.instantiateViewController(withIdentifier: "article_TVC") as! Article_TVC
        navigationController?.pushViewController(Article, animated: true)
    }

    //MARK: CollectionView dataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let congressCell = collectionView.dequeueReusableCell(withReuseIdentifier: SquareCellId, for: indexPath) as! SquareCategoryCell
                //?? as as!
            congressCell.seeAll.addTarget(self, action: #selector(seeAll), for: .touchUpInside)
            congressCell.title.text = "CONGRESS UPDATE"
            
            congressCell.mainView = self
            return congressCell
        }
        else if indexPath.item == 1{
            let expertCell = collectionView.dequeueReusableCell(withReuseIdentifier: SquareCellId, for: indexPath) as! SquareCategoryCell
            //?? as as!
            expertCell.seeAll.addTarget(self, action: #selector(seeAll), for: .touchUpInside)
            expertCell.title.text = "EXPERT COMMENTARY"
            
            expertCell.mainView = self
            return expertCell
        }
        else{
            let BannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCellId, for: indexPath) as! BannerCategoryCell
            BannerCell.mainView = self
            return BannerCell
        }
    }
    
    
    
    //MARK: CollectionView delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
    }
    
    //MARK: CollectionView delegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < numberOfRowBeforeSqueezedRectangle{
            return CGSize(width: self.view.frame.width, height: 253)
        }
        else{
            return CGSize(width: self.view.frame.width, height: 135)
        }
        
    }
}
