//
//  SearchBarVIew.swift
//  practice
//
//  Created by kidnapper on 04/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class SearchBarView: UIView{
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var cancel: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        searchBar.searchBarStyle = .prominent
        searchBar.barTintColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
}
