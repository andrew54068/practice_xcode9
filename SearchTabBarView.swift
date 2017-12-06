//
//  SearchTabBarView.swift
//  practice
//
//  Created by kidnapper on 29/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class SearchTabBarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let cellId = "searchTab_CVCell"
    let tabName = ["ALL", "CONGRESS UPDATE", "EXPERTCOMMENTARY", "EVENT", "TRAIL FACT SHEET", "BOOKMARK"]
    var widthForEachTab: [CGSize]?
    
    @IBOutlet var searchTabCollectionView: UICollectionView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.blue
//        searchTabCollectionView.delegate = self
//        searchTabCollectionView.dataSource = self

    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.backgroundColor = UIColor.blue
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
////        fatalError("init(coder:) has not been implemented")
//    }
    
    //MARK: CollectionView DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return widthForEachTab![indexPath.item]
    }
    
    //MARK: CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchTab_CVCell
        cell.tabName.text = tabName[indexPath.item]
        cell.tabName.sizeToFit()
        widthForEachTab?[indexPath.item] = cell.tabName.frame.size
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    


}
