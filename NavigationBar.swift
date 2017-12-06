//
//  NavigationController.swift
//  practice
//
//  Created by kidnapper on 17/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar{
    override func awakeFromNib() {
        
        self.barStyle = UIBarStyle.default
        self.tintColor = UIColor.red
        
        
        
    }
}


/*class NavigationController: UINavigationController{
 
     override func viewDidLoad() {
     super.viewDidLoad()
     self.navigationBar.barStyle = UIBarStyle.black
     self.navigationBar.tintColor = UIColor(red: 0, green: 102, blue: 204, alpha: 1)
     
     // Do any additional setup after loading the view.
     }
     
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
  }
}*/
 
 
 /*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
 
