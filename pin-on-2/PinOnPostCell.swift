//
//  PinOnPostCell.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/31.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit

class PinOnPostCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var txtPostDesc: UITextView!
    @IBOutlet weak var lblLikes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
    }

    func configureCell(post: PinOnPost) {
        
    }
    
    
}






