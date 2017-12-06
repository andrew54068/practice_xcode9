//
//  Article_TVC.swift
//  practice
//
//  Created by kidnapper on 20/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Article_TVC: UITableViewController {
    
    let titleContent = "A future in mind - rising to the challenge of Alzheimer's"
    let timeContent = "2017.11.21"
    let catagoryContent = "Event/Alzheimer's"
    var isEvent:Bool = false

    private let ThumbnailHeaderCellId = "ThumbnailHeaderCell"
    private let ContentCellId = "ContentCell"
    private let QuizCellId = "QuizCell"
    private let ReferenceCellId = "ReferenceCell"
    private let MayLikeCellId = "MayLikeCell"
    
    @IBOutlet var ThumbnailHeaderView: UIView!
    
    @IBOutlet var articleTitle: UILabel!
    
    @IBOutlet var time: UIButton!
    
    @IBOutlet var catagory: UIButton!
    
    @IBAction func backToPreviousView(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = UIColor.white
        UIApplication.shared.statusBarStyle = .default
        let ThumbnailHeaderNib = UINib(nibName: "ThumbnailHeader_TVCell", bundle: nil)
        tableView.register(ThumbnailHeaderNib, forCellReuseIdentifier: ThumbnailHeaderCellId)
        
        let ContentNib = UINib(nibName: "Content_TVCell", bundle: nil)
        tableView.register(ContentNib, forCellReuseIdentifier: ContentCellId)
        let QuizNib = UINib(nibName: "Quiz_TVCell", bundle: nil)
        tableView.register(QuizNib, forCellReuseIdentifier: QuizCellId)
        let ReferenceNib = UINib(nibName: "Reference_TVCell", bundle: nil)
        tableView.register(ReferenceNib, forCellReuseIdentifier: ReferenceCellId)
        let MayLikeNib = UINib(nibName: "MayLike_TVCell", bundle: nil)
        tableView.register(MayLikeNib, forCellReuseIdentifier: MayLikeCellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.tableHeaderView = ThumbnailHeaderView
        contentSetup()
        navigationController?.isNavigationBarHidden = true
    }
    
    func contentSetup(){
        articleTitle.text = titleContent
        time.setTitle(timeContent, for: .normal)
        time.imageView?.contentMode = .scaleAspectFit
        time.sizeToFit()
        catagory.setTitle(catagoryContent, for: .normal)
        catagory.imageView?.contentMode = .scaleAspectFit
        catagory.sizeToFit()
        
    }
    
    let statusBarBackgroundView: UIView = {
        let view = UIView()
        return view
    }()

    func showArticle(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let article = storyBoard.instantiateViewController(withIdentifier: "article_TVC") as! Article_TVC
//        article.articleTitle.text = "test"
        navigationController?.pushViewController(article, animated: true)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    //MARK: TableView dataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ContentCellId, for: indexPath) as! Content_TVCell
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.item == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: QuizCellId, for: indexPath) as! Quiz_TVCell
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.item == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: ReferenceCellId, for: indexPath) as! Reference_TVCell
            cell.selectionStyle = .none
            cell.isEvent = self.isEvent
            cell.ReferenceContent.textArray = ["Glantz MJ, et al. Gender disparity in the rate of partner abandonment in patients with serious medical illness. Cancer. 2009 Nov 15;115(22):5237–42.", "\"Breast Cancer Early Detection\". cancer.org. 2013-09-17. Retrieved 29 July 2014.","\"Recommendations on screening for breast cancer in average-risk women aged 40–74 years\". Retrieved 2013-02-21.", "\"Final Recommendation Statement: Breast Cancer: Screening\". US Preventive Services Task Force. January 2016. Retrieved 31 May 2017."]
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: MayLikeCellId, for: indexPath) as! MayLike_TVCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    //MARK: tableView delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
            tableView.estimatedRowHeight = 1000
            return tableView.estimatedRowHeight
        }
        else if indexPath.item == 3{
            return 253
        }
        else {
            tableView.estimatedRowHeight = 300
            return tableView.estimatedRowHeight
        }
    }

}
