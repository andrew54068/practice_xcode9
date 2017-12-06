//
//  Search_TVC.swift
//  practice
//
//  Created by kidnapper on 04/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Search_TVC: UITableViewController{
    
    private let cellId = "searchResult_TVCell"
    
    var result_title: [[String]]?
    var result_subtitle: [[String]]?
    var catagory: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SearchResult_TVCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        
        setupTableView()
    }
    
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = result_title, let number = catagory{
            return array[number].count
        }
        print("dataBase||catagory is nil")
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchResult_TVCell
        if let array_title = result_title, let array_subtitle = result_subtitle, let number = catagory{
            cell.title.text = array_title[number][indexPath.item]
            cell.subtitle.text = array_subtitle[number][indexPath.item]
        }else{
            cell.title.text = "please check internet"
            cell.subtitle.text = "please check internet"
        }
        
        return cell
    }
}
