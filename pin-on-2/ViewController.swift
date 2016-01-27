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


    @IBAction func btnLoginPressed(sender: UIButton!) {
        
    }
    
    @IBAction func btnSignupPressed(sender: UIButton!) {
        performSegueWithIdentifier("SignupVC", sender: nil)
    }
    
    @IBAction func btnResetPasswordPressed(sender: UIButton!) {
    
    }
    

}








