//
//  MayLike_TVCell.swift
//  practice
//
//  Created by kidnapper on 20/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class MayLike_TVCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let cellId = "SCVCell"
    
    var article = Article_TVC()
    
    var thumbnailImage = UIImage(named: "thumbnail_tab")
    var titleContent: String = " A future in mind - rising to the challenge in Alzheimer's"
    var subtitleContent: String = "Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative, Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative"
    
    @IBOutlet var View: UIView!
    
    @IBOutlet var content: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "SquareCollectionViewCell", bundle: nil)
        content.register(nib, forCellWithReuseIdentifier: cellId)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        content.delegate = self
        content.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 28, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 193)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        article.showArticle()
        print("123")
    }
    
}





