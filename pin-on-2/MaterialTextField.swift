//
//  MaterialTextField.swift
//  pin-on-2
//
//  Created by 邱国邦 on 16/1/27.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //button 加圆角
        layer.cornerRadius =  4.0
        
        //button 加阴影
        layer.shadowColor = UIColor(red: COLOR_SHADOW, green: COLOR_SHADOW, blue: COLOR_SHADOW, alpha: 8.0).CGColor
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.shadowRadius =  1.0
        layer.shadowOpacity = 0.8

    }
    
    //实现placeholder 和 text 缩进
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10.0, 0.0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10.0, 0.0)
    }
    
}
