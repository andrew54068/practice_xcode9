//
//  TableViewController2.swift
//  practice
//
//  Created by kidnapper on 07/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Event_VC: UITableViewController {

    private let cellId = "RTVCell"
    
//    @IBOutlet var tableView: UITableView!
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let navigationHeight = topLayoutGuide.length
//        tableView
//    }
    
    var thumbnailImage = UIImage(named: "thumbnail_tab")
    var titleContent: String = " A future in mind - rising to the challenge in Alzheimer's"
    var subtitleContent: String = "Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative, Doretha Burrell-nickname “Dee” by children at the school where she once worked as administrative"
    
    var hadRead: [Bool] = [false, false, false, false, false]
    
    var selectedFilter: Int?
    var selectedtext: [String] = ["All"]
    
    var selectionView: selectionView!
    var pickerView: pickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        
        selectionSetup()
        tableViewSetup()
        pickerViewSetup()
    }
    
    func tableViewSetup(){
        tableView.contentInset = UIEdgeInsetsMake(109, 0, 0, 0)
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 109, left: 0, bottom: 0, right: 0)
        tableView.tableHeaderView = selectionView
        
        //?? without this header become strange after adding navigation bar
        view.autoresizesSubviews = false
    }
    
    func selectionSetup(){
        let selectionNib = UINib(nibName: "selectionView", bundle: nil)
        selectionView = selectionNib.instantiate(withOwner: self, options: nil).first as! selectionView
        selectionView.left.setTitle("All disease", for: .normal)
        selectionView.left.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        selectionView.updateConstraint()
        selectionView.right.isEnabled = false
        
    }
    
    func pickerViewSetup(){
        let pickerViewNib = UINib(nibName: "pickerView", bundle: nil)
        pickerView = pickerViewNib.instantiate(withOwner: self, options: nil).first as! pickerView
        
        let flexible = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let item = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(comfirmSelection(sender:)))
        let fix = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        fix.width = 9
        pickerView.toolbar.setItems([flexible, item, fix], animated: true)
        
        selectionView.left.tag = kindOfPickerView.disease.rawValue
        selectionView.left.addTarget(self, action: #selector(CategoryPicked), for: .touchUpInside)
    }
    
    func CategoryPicked(sender: UIButton){
        showPickerView(PickerView: pickerView, selectionView: selectionView, type: sender.tag, lastSelected: selectedtext)
        
        let window = UIApplication.shared.keyWindow!
        window.addSubview(unfocus)
        unfocus.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: window.frame.height)
        unfocus.addTarget(self, action: #selector(dismissUnfocus), for: .touchUpInside)
        pickerView.frame = CGRect(x: 0, y: window.bounds.maxY - 261, width: tableView.frame.width, height: 261)
        unfocus.addSubview(pickerView)
    }
    let unfocus:UIButton = {
        let View = UIButton()
        View.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return View
    }()
    
    func comfirmSelection(sender: UIBarButtonItem){
        dismissUnfocus(sender: sender)
        selectionView.left.setTitle(pickerView.result[0], for: .normal)
        selectedtext = pickerView.result
//        print("text = \(selectionView.left.titleLabel?.text)||")
    }
    
    func dismissUnfocus(sender: Any) {
        pickerView.removeFromSuperview()
        unfocus.removeFromSuperview()
        tableView.isScrollEnabled = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 298
        }
        return 318
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        cell.hadRead = self.hadRead[indexPath.item]
        
        if indexPath.row == 0{
            cell.topConstraint.isActive = false
        }else{
            cell.topConstraint.isActive = true
        }
        
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
        cell.author.text = "DISEASE / Alzheimer’s"
        cell.date.text = "2 hours ago"
        cell.title.numberOfLines = 4
        cell.title.lineBreakMode = .byTruncatingTail
        if cell.hadRead{
            cell.attributedString = attributedString1
        }else{
            cell.attributedString.append(attributedString1)
        }
        cell.title.attributedText = cell.attributedString!
        
        cell.selectionStyle = .none
        
        //disable bookmark
        cell.bookmark.isEnabled = false
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var article = Article_TVC()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        article = storyBoard.instantiateViewController(withIdentifier: "article_TVC") as! Article_TVC
        article.isEvent = true
        self.hadRead[indexPath.item] = true
        navigationController?.pushViewController(article, animated: true)
        tableView.reloadData()
    }
}
