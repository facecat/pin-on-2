//
//  PostVC.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/31.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts = [PinOnPost]()
    
    @IBOutlet weak var tableview: UITableView!
    
    //make-post text & image
    @IBOutlet weak var txtMakePost: UITextField!
    @IBOutlet weak var imgMakePost: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
        
        //parse data from firebse when ANY data changed.
        DataService.ds.REF_POSTS.observeEventType(.Value) { (snapshot: FDataSnapshot!) -> Void in
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    let key = snap.key
                    print(snap.key)
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let post = PinOnPost(postkey: key, dict: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableview.reloadData()
        }
    }
    
    
    //MARK: UITableViewDataSource, UITableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(posts[indexPath.row].postDescription)
        
//        if let cell = tableView.dequeueReusableCellWithIdentifier(PIN_ON_POST_CELL) as? PinOnPostCell {
//            cell.configureImgCell(posts[indexPath.row])
//            return cell
//        } else {
//            return PinOnPostCell()
//        }
        return tableview.dequeueReusableCellWithIdentifier(PIN_ON_POST_CELL)!
    }
}







