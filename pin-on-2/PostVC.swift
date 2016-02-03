//
//  PostVC.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/31.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class PostVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts = [PinOnPost]()
    static var imageCache = NSCache()
    
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
        let po = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(PIN_ON_POST_CELL) as? PinOnPostCell {
            
            //cancle early request when reuse cell.
            cell.request?.cancel()
            
            //try get stored image from cache.
            var image: UIImage?
            if let url = po.postImgUrl {
                image = PostVC.imageCache.objectForKey(url) as? UIImage
            }
            
            cell.configureImgCell(po, img: image)
            return cell
        } else {
            return PinOnPostCell()
        }
    }
}







