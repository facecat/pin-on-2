//
//  ViewController.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/26.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var loginBackgroundImg: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //if storedUid exist, auto login.
        if let storedUid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) {
            print("sotreduid:\(storedUid)")
            performSegueWithIdentifier(SEGUE_LOG_IN, sender: nil)
        }
    }


    @IBAction func btnLoginPressed(sender: UIButton!) {
        if let email = emailTextField.text where email != "", let psw = passwordTextField.text where psw != "" {
            DataService.ds.REF_ROOT.authUser(email, password: psw, withCompletionBlock: { error, authData in
                if error != nil {
                    print("\(error.code)")
                } else {
                    
                }
            })
        } else {
            print("need email and password")
        }
    }
    
    @IBAction func btnSignupPressed(sender: UIButton!) {
        performSegueWithIdentifier(SEGUE_SIGN_UP, sender: nil)
    }
    
    @IBAction func btnResetPasswordPressed(sender: UIButton!) {
    
    }
    

}








