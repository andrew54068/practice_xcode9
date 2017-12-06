/*
//
//  RocheCategoryCollectionView.swift
//  practice
//
//  Created by kidnapper on 14/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class SquareCategoryCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    private let cellId = "SCVCell"
    var titleContent: String = ""
    var subtitleContent: String = ""
    var attributedString: NSMutableAttributedString!
    var count:Int = 0

//    let layout = RocheCategoryCell1()
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    
//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: layout)
//        self.setUpView()
////        self.setUpView()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    func setUpView(){
        self.translatesAutoresizingMaskIntoConstraints = false
//        layout.scrollDirection = .horizontal
//        self.delegate = self
//        self.dataSource = self
        let nib = UINib(nibName: "SquareCollectionViewCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellId)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SquareCollectionViewCell
        
        let attrs1 = [NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold), NSForegroundColorAttributeName: UIColor.black]
        let attrs2 = [NSFontAttributeName: UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor.gray]
        let attributedString1 = NSMutableAttributedString(string: "\(titleContent)", attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "\(subtitleContent)", attributes: attrs2)
        let line_feed = NSMutableAttributedString(string: "\n")
        if subtitleContent != ""{
            attributedString1.append(line_feed)
        }
        attributedString1.append(attributedString2)
        if count > 1{
            cell.hadRead = true
        }
        
        cell.thumbnail.image = UIImage(named: "thumbnail_main")
        cell.patient.text = "Patients"
        cell.time.text = "2 hours ago"
        cell.title.numberOfLines = 4
        cell.title.lineBreakMode = .byTruncatingTail
        if cell.hadRead{
            cell.attributedString = attributedString1
        }else{
            cell.attributedString.append(attributedString1)
        }
        cell.title.attributedText = cell.attributedString!
        // Configure the cell
        
//        print("cell.title = \(String(describing: cell.title.attributedText!))")
        
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 193)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            titleContent = " A future in mind - rising to the challenge in Alzheimer's"
            subtitleContent = "Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative, Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative"
            count += 1
            collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
//extension UIView {
//    class func fromNib<T: UIView>() -> T {
//        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
//    }
//}
*/
