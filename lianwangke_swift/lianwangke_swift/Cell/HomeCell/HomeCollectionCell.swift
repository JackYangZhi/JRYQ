//
//  HomeCollectionCell.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/6.
//  Copyright © 2016年 杨星. All rights reserved.
//

import Foundation
import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    var downView : UIView!
    var imageVIew : UIImageView!
    var titleLabel : UILabel!
    var locatImageView : UIImageView!
    var distanceLabel : UILabel!
    var contentLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //初始化各种控件
        downView=UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        downView.isUserInteractionEnabled=true
        downView.backgroundColor=UIColor.clear
        downView.layer.cornerRadius=4.0
        downView.layer.borderWidth=0.5
        downView.layer.borderColor=UIColor.lightGray.cgColor
        self.addSubview(downView)
        
        imageVIew=UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        imageVIew.contentMode=UIViewContentMode.scaleAspectFit
        downView.addSubview(imageVIew)
        
        titleLabel=UILabel(frame: CGRect(x: self.frame.size.width-110, y: imageVIew.frame.height+16, width: 100, height: 31))
        titleLabel.textAlignment=NSTextAlignment.right
        titleLabel.lineBreakMode=NSLineBreakMode.byClipping
        titleLabel.numberOfLines=0
        titleLabel.font=UIFont.boldSystemFont(ofSize: 15)
        downView.addSubview(titleLabel)
        
        locatImageView=UIImageView(frame: CGRect(x: 10, y: imageVIew.frame.height+30, width: 20, height: 28))
        locatImageView.image=UIImage(named: "homeLocationCell")
        downView.addSubview(locatImageView)
        
        distanceLabel=UILabel(frame: CGRect(x: 29, y: imageVIew.frame.height+40, width: 70, height: 21))
        distanceLabel.textColor=colorValueRGB("#55A6FF")
        distanceLabel.textAlignment=NSTextAlignment.left
        distanceLabel.font=UIFont.systemFont(ofSize: 13)
        downView.addSubview(distanceLabel)
        
        contentLabel=UILabel(frame: CGRect(x: 10, y: imageVIew.frame.height+60, width: self.frame.size.width-20, height: self.frame.size.height-(imageVIew.frame.height+65)))
        contentLabel.font=UIFont.systemFont(ofSize: 12)
        contentLabel.numberOfLines=0;
        contentLabel.lineBreakMode=NSLineBreakMode.byWordWrapping
        downView.addSubview(contentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //super.init(coder: aDecoder)
    }
}
