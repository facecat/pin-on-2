//
//  PostVC.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/31.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit

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
    }
    
    
    //MARK: UITableViewDataSource, UITableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableview.dequeueReusableCellWithIdentifier(PIN_ON_POST_CELL)!
    }
}







