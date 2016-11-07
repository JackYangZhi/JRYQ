//
//  OrderMainVC.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/6.
//  Copyright © 2016年 杨星. All rights reserved.
//

import Foundation
import UIKit
import SnapKit



class OrderMainVC: UIViewController {
    
    var box = UIView()
    
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.white
        
        
        label.backgroundColor=UIColor.red
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(10)//左
            make.right.equalTo(self.view).offset(-10)//右
            make.top.equalTo(self.view).offset(84)//上
            make.bottom.equalTo(self.view).offset(-90)//下
            //make.height.equalTo(100)//定制
        }
        //系统写法
//        label.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalTo(self.view).offset(10)//左
//            ConstraintMaker.right.equalTo(self.view).offset(-10)//右
//            ConstraintMaker.top.equalTo(self.view).offset(84)//上
//            ConstraintMaker.bottom.equalTo(self.view).offset(-90)//下
//        }
        
        
    
    }
    
}
