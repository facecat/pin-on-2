//
//  DataService.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/27.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://pin-on.firebaseio.com"

class DataService {
    
    static let ds = DataService()
    
    let REF_ROOT = Firebase(url: "\(BASE_URL)")
    let REF_USERS = Firebase(url: "\(BASE_URL)/users")
    let REF_POSTS = Firebase(url: "\(BASE_URL)/posts")
    
    
}



