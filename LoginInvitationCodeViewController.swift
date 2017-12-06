//
//  LoginInvitationCodeViewController.swift
//  RocheCIT_iOS
//
//  Created by Paul Hsieh on 2017/12/1.
//  Copyright © 2017年 25sprout. All rights reserved.
//

import UIKit

class LoginInvitationCodeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var invitationFirstDigitTextField: UITextField!
    @IBOutlet weak var invitationSecondDigitTextField: UITextField!
    @IBOutlet weak var invitationThirdDigitTextField: UITextField!
    @IBOutlet weak var invitationFourthDigitTextField: UITextField!
    @IBOutlet weak var invitationFifthDigitTextField: UITextField!
    @IBOutlet weak var invitationSixthDigitTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickRequestInvitationCode(_ sender: Any) {
        self.performSegue(withIdentifier: "RequestInvitationCodeSegue", sender: nil)
    }

    @IBAction func onClickLoginWithEmail(_ sender: Any) {
        self.performSegue(withIdentifier: "EmailLoginSegue", sender: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK:- UITextField delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // back button
        if string == "" {
            return true
        }
        // just in case for pasting out of expecting cases by user
        else if Int(string) == nil || string.characters.count > 1 {
            return false
        }
        else {
            textField.text = string
            switch textField.tag {
            case 1:
                invitationSecondDigitTextField.becomeFirstResponder()
            case 2:
                invitationThirdDigitTextField.becomeFirstResponder()
            case 3:
                invitationFourthDigitTextField.becomeFirstResponder()
            case 4:
                invitationFifthDigitTextField.becomeFirstResponder()
            case 5:
                invitationSixthDigitTextField.becomeFirstResponder()
            case 6:
                invitationSixthDigitTextField.resignFirstResponder()
            default:
                invitationSecondDigitTextField.becomeFirstResponder()
            }
            return false
        }
    }

}
