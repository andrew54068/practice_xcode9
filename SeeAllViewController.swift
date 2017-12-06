//
//  SeeAllViewController.swift
//  practice
//
//  Created by kidnapper on 05/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//
import UIKit

class SeeAllViewController: TabPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func handleSearch() {
        let search_TPVC = Search_TPVC()
        navigationController?.pushViewController(search_TPVC, animated: true)
    }
   
}
