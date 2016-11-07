//
//  common.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/6.
//  Copyright © 2016年 杨星. All rights reserved.
//

import Foundation
import UIKit

let screenWidth = UIScreen.main.bounds.size.width

let screenHeight = UIScreen.main.bounds.size.height

let userDefault = UserDefaults.standard

//十六进制颜色转换
func colorValueRGB ( _ Color_Value:NSString)->UIColor{
    var  Str :NSString = Color_Value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() as NSString
    if Color_Value.hasPrefix("#"){
        Str=(Color_Value as NSString).substring(from: 1) as NSString
    }
    let Red = (Str as NSString ).substring(to: 2)
    let Green = ((Str as NSString).substring(from: 2) as NSString).substring(to: 2)
    let Blue = ((Str as NSString).substring(from: 4) as NSString).substring(to: 2)
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string:Red).scanHexInt32(&r)
    Scanner(string: Green).scanHexInt32(&g)
    Scanner(string: Blue).scanHexInt32(&b)
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
}
