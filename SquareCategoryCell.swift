//
//  RocheCategoryCell.swift
//  practice
//
//  Created by kidnapper on 14/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//
import UIKit

//protocol buttonClicked: class {
//    func seeAllButtonClicked()
//}

class SquareCategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var mainView: Main_VC?
    
//    weak var delegate: buttonClicked?
    private let cellId = "SCVCell"
    var titleContent: String = " A future in mind - rising to the challenge in Alzheimer's"
    var subtitleContent: String = "Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative, Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative"
    var attributedString: NSMutableAttributedString!
    
    var hadRead: [Bool] = [false, false, false, false, false, false]
    
    @IBOutlet var content: UICollectionView!
    @IBOutlet var title: UILabel!
    
    @IBOutlet var seeAll: UIButton!
    
//    @IBAction func seeAllClicked(_ sender: Any){
//        print("%%%%%%")
////        delegate?.seeAllButtonClicked()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews(){
        
        let nib = UINib(nibName: "SquareCollectionViewCell", bundle: nil)
        content.register(nib, forCellWithReuseIdentifier: cellId)
        content.delegate = self
        content.dataSource = self
    }
    
    
    //MARK: CollectionView dataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SquareCollectionViewCell
        
        cell.hadRead = self.hadRead[indexPath.item]
        
        let attrs1 = [NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold), NSForegroundColorAttributeName: UIColor.black]
        let attrs2 = [NSFontAttributeName: UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor.gray]
        let attributedString1 = NSMutableAttributedString(string: "\(titleContent)", attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "\(subtitleContent)", attributes: attrs2)
        let line_feed = NSMutableAttributedString(string: "\n")
        if subtitleContent != ""{
            attributedString1.append(line_feed)
        }
        attributedString1.append(attributedString2)
        
        cell.thumbnail.image = UIImage(named: "img_smallcard")
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
 
        return cell
    }
    
    
    //MARK: CollectionView delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSelector(inBackground: #selector(Main_VC.seeAll), with: nil)
        self.hadRead[indexPath.item] = true
        collectionView.reloadData()
        
        mainView?.showArticle()
    }
    
    //MARK: CollectionView delegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 28, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 193)
    }
    
}


