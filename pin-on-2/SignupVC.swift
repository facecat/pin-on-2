//
//  SignupVC.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/28.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit
import Firebase

class SignupVC: UIViewController {

    @IBOutlet weak var txtSignupEmail: UITextField!
    @IBOutlet weak var txtSignupPassword: UITextField!
    @IBOutlet weak var txtSignupUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    @IBAction func btnCancelSignupPressed(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnConfirmSignupPressed(sender: UIButton!) {
        if let email = txtSignupEmail.text where email != "", let psw = txtSignupPassword.text where psw != "", let username = txtSignupUsername.text where username != "" {
            
            print(email)
            print(psw)
            print(username)

            //限制密码复杂度。
            if psw.characters.count >= 8 {
                DataService.ds.REF_ROOT.createUser(email, password: psw, withValueCompletionBlock: { (err: NSError!, data: [NSObject : AnyObject]!) -> Void in
                    
                    if let uid = data[KEY_UID] as? String {
                        DataService.ds.REF_ROOT.authUser(email, password: psw, withCompletionBlock: { (err: NSError!, authData: FAuthData!) -> Void in
                            if err != nil {
                                
                            } else {
                                //the key-value data need to be stored     
                                let newuser = [KEY_USER_NAME: "\(username)", KEY_PROVIDER: authData.provider]
                                DataService.ds.REF_USERS.childByAppendingPath(uid).setValue(newuser)
                                
                                //store uid locally
                                NSUserDefaults.standardUserDefaults().setValue(uid, forKey: KEY_UID)
                            }
                        })
                        
                        //finish signup and dismiss self
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                })
            } else {
                print("password need at least 8 characrers")
            }

        } else {
            //没有正确输入email／password／username。
            print("need email password username!")
        }
    }
}






