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
    @IBOutlet weak var heartImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
    }

    //make a post with an image.
    func configureImgCell(post: PinOnPost) {
        lblUserName.text = post.userName
        
        //show likes label where more than 1 likes there.
        if  post.likesNum  > 0 {
            lblLikes.text = "\(post.likesNum)热度"
        } else  {
            lblLikes.text = ""
        }
        
        
    }
    
    
}






