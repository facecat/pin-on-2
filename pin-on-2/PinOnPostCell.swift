//
//  PinOnPostCell.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/31.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit
import Alamofire

class PinOnPostCell: UITableViewCell {

    var request: Request?
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var postCellImg: UIImageView!
    @IBOutlet weak var txtPostDesc: UITextView!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var heartImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
    }

    //make a post with an image.
    func configureImgCell(post: PinOnPost, img: UIImage?) {
        lblUserName.text = post.userName
        
        //show likes label where more than 1 likes there.
        if  post.likesNum  > 0 {
            lblLikes.text = "\(post.likesNum)  热度"
        } else  {
            lblLikes.text = ""
        }
        
        txtPostDesc.text = post.postDescription
        
        //handle image issue
        if let url = post.postImgUrl {
            if img != nil {
                postCellImg.image = img
            } else {
                request = Alamofire.request(.GET, url).validate(contentType: ["image/*"]).response(completionHandler: { reuqest, response, data, error in
                    if error == nil {
                        if let downloadData = data {
                            let img = UIImage(data: downloadData)!
                            self.postCellImg.image = img
                            PostVC.imageCache.setObject(img, forKey: url)
                        }
                    }
                })
            }
        } else {
            postCellImg.hidden = true
        }
        
    }
    
    
}






