//
//  RocheCategoryCell2.swift
//  practice
//
//  Created by kidnapper on 15/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class BannerCategoryCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    private let cellId = "BCVCell"
    
    @IBOutlet var content: BannerCategoryCollectionView!
    
    var mainView: Main_VC?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    func setUpViews(){
        content.delegate = self
        content.dataSource = self
        
        
        let nib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        content.register(nib, forCellWithReuseIdentifier: cellId)
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        content.collectionViewLayout = layout
    }

    //MARK: CollectionView dataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BannerCollectionViewCell
        let image = UIImage(named: "img_bigcard")
        cell.rectangleImage.image = image
        cell.rectangleLabel.text = "AE MANAGEMENT TOOL"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    //MARK: CollectionView delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("present segue to certain tab")
        collectionView.reloadData()
        mainView?.showArticle()
    }
    
    //MARK: CollectionView flowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 15, bottom: 18, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 100)
    }
    
    
    
}





