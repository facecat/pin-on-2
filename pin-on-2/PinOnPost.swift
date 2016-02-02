//
//  PinOnPost.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/31.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import Foundation

class PinOnPost {
    
    private var _userName: String!
    private var _postDescription: String!
    private var _postImg: String?
    private var _likesNum: Int!
    private var _postKey: String!
    
    var postKey: String {
        return _postKey
    }
    
    var likesNum: Int {
        return _likesNum
    }
    
    var userName: String {
        return _userName
    }
    
    var postDescription: String {
        return _postDescription
    }
    
    var postImg: String? {
        return _postImg
    }
    
    //Creat a post
    init(desc: String, img: String?, username: String) {
        _postDescription = desc
        _postImg = img
        _userName = username
    }
    
    //download a post from firebase
    init(postkey: String, dict: Dictionary<String, AnyObject>) {
        _postKey = postkey
        
        if let likes = dict["likes"] as? Int {
            _likesNum = likes
        }
        
        if let name = dict["username"] as? String {
            _userName = name
        }
        
        if let desc = dict["description"] as? String {
            _postDescription = desc
        }
        
        if let img = dict["imageUrl"] as? String {
            _postImg = img
        }
    }
}






