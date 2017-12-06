//
//  Search_VC.swift
//  practice
//
//  Created by kidnapper on 29/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Search_VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    private let collectionViewCellId = "searchTab_CVCell"
    private let tableViewCellId = "searchResult_TVCell"
    private let tableViewHeaderCellId = "searchResultHeader_TVCell"
    
    let tabName = ["ALL", "CONGRESS UPDATE", "EXPERTCOMMENTARY", "EVENT", "TRAIL FACT SHEET", "BOOKMARK"]
    var widthForEachTab: [CGFloat]?
    
    var selectedRow: Int = 0
    var currentOffSet = CGPoint(x: 0, y: 0)
    
    @IBOutlet var searchBtn: UIButton!
    
    @IBOutlet var searchView: UIView!
    
    @IBOutlet var tabBarCollectionView: UICollectionView!
    
    @IBOutlet var searchResultTableView: UITableView!
    
    @IBOutlet var searchTextField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    
    var articles: [[String:AnyObject]]!
    var foundArticles: [[String:AnyObject]]!
    var selectedArticle: [String:AnyObject]!
    
    var resultController: UITableViewController!
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        searchBtn.layer.cornerRadius = 5
        
        tableViewSetup()
        collectionViewSetup()
        
    }
    
    func tableViewSetup(){
        self.searchResultTableView.backgroundColor = UIColor.blue
        let searchResultViewNib = UINib(nibName: "SearchResult_TVCell", bundle: nil)
        searchResultTableView.register(searchResultViewNib, forCellReuseIdentifier: tableViewCellId)
        let searchResultHeader_TVCellNib = UINib(nibName: "SearchResultHeader_TVCell", bundle: nil)
        searchResultTableView.register(searchResultHeader_TVCellNib, forCellReuseIdentifier: tableViewHeaderCellId)
        
        
    }
    
    func collectionViewSetup() {
        let tabBarCollectionViewNib = UINib(nibName: "SearchTab_CVCell", bundle: nil)
        tabBarCollectionView.register(tabBarCollectionViewNib, forCellWithReuseIdentifier: collectionViewCellId)
        tabBarCollectionView.frame = CGRect(x: 0, y: searchView.frame.height, width: UIScreen.main.bounds.width, height: 45)
        
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        layout.estimatedItemSize = CGSize(width: 10, height: 45)
        
        tabBarCollectionView.collectionViewLayout = layout
        
        tabBarCollectionView.showsHorizontalScrollIndicator = false
        tabBarCollectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: (layout.minimumLineSpacing - 10) * 5 + 15)
    }

    //MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! SearchResult_TVCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    //MARK: CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath) as! SearchTab_CVCell
        cell.tabName.text = tabName[indexPath.item]
        
        if selectedRow == indexPath.item{
            cell.tabName.textColor = UIColor(red: 0/255, green: 102/255, blue: 204/255, alpha: 1.0)
            cell.highlightView.isHidden = false
        }
        else{
            cell.tabName.textColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
            cell.highlightView.isHidden = true
        }
        
        widthForEachTab?[indexPath.item] = cell.frame.width
//        print("currentOffSet = \(collectionView.contentOffset)")
//        collectionView.contentOffset = currentOffSet
        return cell
    }
    
    
    // MARK: CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.item
        collectionView.reloadData()
        collectionView.sizeToFit()
        currentOffSet = collectionView.contentOffset
        print("currentOffSet = \(collectionView.contentOffset)")
        collectionView.layoutIfNeeded()
        
        
        print("currentOffSet after layoutIfNeeded = \(collectionView.contentOffset)")
        collectionView.contentOffset = currentOffSet
    }
    
//    collectionViewscrollto
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
