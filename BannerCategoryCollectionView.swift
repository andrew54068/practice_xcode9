//
//  RocheCategoryCollectionView2.swift
//  practice
//
//  Created by kidnapper on 15/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class BannerCategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private let cellId = "BCVCell"
    
    let layout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        self.delegate = self
        self.dataSource = self
        let nib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellId)
        self.layout.sectionInset = UIEdgeInsets(top: 14, left: 0, bottom: 18, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BannerCollectionViewCell
        let image = UIImage(named: "thumbnail_tab")
        cell.rectangleImage.image = image
        cell.rectangleLabel.text = "AE MANAGEMANT TOOL"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    
}
