//
//  ConfirmUserDetailViewController.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/12/4.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class ConfirmUserDetailViewController: UIViewController {
    
    @IBOutlet var textfield1: PHCheckableTextfield!
    
    @IBOutlet var textfield2: PHCheckableTextfield!
    
    @IBOutlet var textfield3: PHCheckableTextfield!
    

    @IBAction func onClickLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textfield1.warningType = .none
        textfield2.warningType = .correct
        textfield3.warningType = .warning

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
