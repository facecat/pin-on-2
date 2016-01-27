//
//  MaterialView.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/27.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //button 加圆角
        layer.cornerRadius =  4.0
        
        //button 加阴影
        layer.shadowColor = UIColor(red: COLOR_SHADOW, green: COLOR_SHADOW, blue: COLOR_SHADOW, alpha: 8.0).CGColor
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.shadowRadius =  5.0
        layer.shadowOpacity = 0.8

    }
}
