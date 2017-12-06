//
//  TableViewController3.swift
//  practice
//
//  Created by kidnapper on 15/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class TrailFactSheet_VC: UITableViewController {

    private let cellId = "TrailFactSheet_TVCell"
    
    var selectedFilter: Int?
    var selectedtext: String?
    var leftSelectedtext: [String] = ["All"]
    var rightSelectedtext: [String] = ["All"]
    
    var selectionView: selectionView!
    var pickerView: pickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TrailFactSheet_TVCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        
//        tableView.contentOffset = CGPoint(x: 15, y: 20)
//        tableView.contentInset = UIEdgeInsets(top: 101, left: 15, bottom: 15, right: 15)
        tableView.contentInset = UIEdgeInsets(top: 121, left: 0, bottom: 15, right: 0)
        selectionSetup()
        tableViewSetup()
        pickerViewSetup()
        
    }

    func tableViewSetup(){
        tableView.estimatedRowHeight = 140
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
        selectionView.right.setTitle("All stage", for: .normal)
        selectionView.left.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        selectionView.right.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
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
        selectionView.right.tag = kindOfPickerView.stage.rawValue
        selectionView.right.addTarget(self, action: #selector(CategoryPicked), for: .touchUpInside)
    }
    
    func CategoryPicked(sender: UIButton){
        if sender.tag == kindOfPickerView.disease.rawValue{
            pickerView.selected = sender.tag
            showPickerView(PickerView: pickerView, selectionView: selectionView, type: sender.tag, lastSelected: leftSelectedtext)
            print("leftSelectedtext = \(leftSelectedtext)")
            selectedFilter = kindOfPickerView.disease.rawValue
        }else if sender.tag == kindOfPickerView.stage.rawValue{
            pickerView.selected = sender.tag
            showPickerView(PickerView: pickerView, selectionView: selectionView, type: sender.tag, lastSelected: rightSelectedtext)
            print("rightSelectedtext = \(rightSelectedtext)")
            selectedFilter = kindOfPickerView.stage.rawValue
        }
        
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
        if selectedFilter == kindOfPickerView.disease.rawValue{
            print("leftSelectedtext = \(leftSelectedtext)")
            selectionView.left.setTitle(pickerView.result[0], for: .normal)
            leftSelectedtext = pickerView.result
            selectionView.left.titleLabel?.sizeToFit()
        }
        else{
            print("rightSelectedtext = \(rightSelectedtext)")
            selectionView.right.setTitle(pickerView.result[0], for: .normal)
            rightSelectedtext = pickerView.result
            selectionView.right.titleLabel?.sizeToFit()
        }
    }
    
    func dismissUnfocus(sender: Any) {
        pickerView.removeFromSuperview()
        unfocus.removeFromSuperview()
        tableView.isScrollEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TrailFactSheet_TVCell
        
        if indexPath.row == 0{
            cell.topConstraint.isActive = false
        }else{
            cell.topConstraint.isActive = true
        }

        cell.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        cell.selectionStyle = .none
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 120
        }
        return 140
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
