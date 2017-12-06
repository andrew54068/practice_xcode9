//
//  Search_TPVC.swift
//  practice
//
//  Created by kidnapper on 04/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Search_TPVC: TabPageViewController{
    
    var searchBarView: SearchBarView?
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        self.modalTransitionStyle = .coverVertical
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        searchBarView!.removeFromSuperview()
    }
    
    func navigationBarSetup(){
        let searchBar_nib = UINib(nibName: "SearchBarView", bundle: nil)
        searchBarView = searchBar_nib.instantiate(withOwner: nil, options: nil).first as? SearchBarView
        UIApplication.shared.keyWindow?.addSubview(searchBarView!)
        //        self.view.addSubview(searchBarView)
        searchBarView!.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 44)
        searchBarView!.cancel.addTarget(self, action: #selector(backToPreviousVC), for: .touchUpInside)
        //        navigationController?.isNavigationBarHidden = true
        //        navigationBar = searchBarView
    }
    
    func backToPreviousVC(){
        navigationController?.popViewController(animated: true)
    }
}
