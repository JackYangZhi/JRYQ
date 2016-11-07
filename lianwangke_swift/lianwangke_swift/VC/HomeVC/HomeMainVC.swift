//
//  HomeMainVC.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/6.
//  Copyright © 2016年 杨星. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


////用户信息
//UIView *_headerSectionView;
//UIImageView *_photoImageView;
//UILabel *_nameLabel;
//UILabel *_money1;
//UILabel *_money2;


class HomeMainVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //只能用变量var
    
    var topView : UIView!
    
    //用户信息
    var headerUserView : UIView!
    
    var photoImageView : UIImageView!
    
    var nameLabel : UILabel!
    
    var money1Label : UILabel!
    
    var money2Label : UILabel!
    
    //功能区
    var functionView : UIView!
    
    //原来的按钮
    var btnView : UIView!
    
    //列表
    var collectView : UIView!
    
    var collectionView : UICollectionView!
    
    //数据
    var dataArr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="home"
//        //修改导航栏背景色
//        self.navigationController?.navigationBar.barTintColor = colorValueRGB("#55A6FF")
//        //修改导航栏标题文字颜色
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        //修改导航栏按钮颜色
//        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
//        //修改导航栏背景图片
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bg5"), forBarMetrics: .Default)
        
        //隐藏导航栏
        self.navigationController?.isNavigationBarHidden=true
        self.view.backgroundColor=UIColor.white
        
        
        self.createTopView()
        
        //self.creatCollectionView()
        self.creatFunctionView()
    }
    
    //头部蓝色块
    func createTopView(){
        /*
        topView=UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 222))
        topView.isUserInteractionEnabled=true
        topView.backgroundColor=colorValueRGB("55A6FF")
        self.view.addSubview(topView)
        
        //创建选项按钮
        let arrayImage = ["MainBtn1","MainBtn2","MainBtn3","MainBtn4"]
        let arrayTitle = ["景区导览","团友功能","邀请好友","新闻资讯"]
        let xWidth=(screenWidth-CGFloat(arrayImage.count)*52)/5
        for index in 0...arrayImage.count - 1 {
            btnView=UIView(frame: CGRect(x: xWidth + 52*CGFloat(index) + xWidth * CGFloat(index), y: 140, width: 52, height: 67))
            btnView.isUserInteractionEnabled=true
            btnView.backgroundColor=UIColor.clear
            topView.addSubview(btnView)
            
            let imageView=UIImageView(frame: CGRect(x: 2, y: 0, width: 48, height: 48))
            imageView.isUserInteractionEnabled=true
            imageView.tag=10+index
            imageView.image=UIImage(named: arrayImage[index])
            btnView.addSubview(imageView)
            
            let label=UILabel(frame: CGRect(x: 0, y: 51, width: 52, height: 16))
            label.font=UIFont.systemFont(ofSize: 13)
            label.textAlignment=NSTextAlignment.center
            label.textColor=UIColor.white
            label.text=arrayTitle[index]
            btnView.addSubview(label)
            
            let btn = UIButton(type: UIButtonType.custom)
            btn.frame = CGRect(x: xWidth + 52*CGFloat(index) + xWidth * CGFloat(index), y: 140, width: 52, height: 67)
            btn.tag = 1 + index
            btn.backgroundColor=UIColor.clear
            btn.addTarget(self, action: #selector(HomeMainVC.btnClick(_:)), for: UIControlEvents.touchUpInside)
            topView.addSubview(btn)
        }
 */
        
        headerUserView=UIView(frame: CGRect(x:0, y:20, width:screenWidth, height:207))
        headerUserView.isUserInteractionEnabled=true
        headerUserView.backgroundColor=colorValueRGB("55A6FF")
        self.view.addSubview(headerUserView)
        
        nameLabel=UILabel(frame: CGRect(x:0,y:10,width:screenWidth,height:30))
        nameLabel.font=UIFont.systemFont(ofSize: 18)
        nameLabel.textAlignment=NSTextAlignment.center
        nameLabel.textColor=UIColor.white
        headerUserView.addSubview(nameLabel)
        
        photoImageView=UIImageView(frame:CGRect(x:(screenWidth-68)/2,y:48,width:68,height:68))
        photoImageView.isUserInteractionEnabled=true
        photoImageView.contentMode=UIViewContentMode.scaleAspectFit
        photoImageView.clipsToBounds=true
        photoImageView.layer.shadowColor=UIColor.clear.cgColor
        photoImageView.layer.shadowOffset=CGSize(width: 4, height: 4)
        photoImageView.layer.shadowOpacity=0.5
        photoImageView.layer.shadowRadius=2.0
        photoImageView.layer.borderColor=UIColor.red.cgColor
        photoImageView.layer.borderWidth=2.0
        photoImageView.layer.masksToBounds=true
        photoImageView.layer.cornerRadius=photoImageView.frame.size.height/2
        photoImageView.image=UIImage(named: "photo")
        headerUserView.addSubview(photoImageView)
        
        let label1=UILabel(frame:CGRect(x:(screenWidth-0.5)/2,y:126,width:0.5,height:26.5))
        label1.backgroundColor=UIColor.white
        headerUserView.addSubview(label1)
        
        money1Label=UILabel(frame:CGRect(x:0,y:122,width:(screenWidth-0.5)/2,height:24))
        money1Label.textAlignment=NSTextAlignment.center
        money1Label.textColor=UIColor.white
        money1Label.text="¥0.00"
        headerUserView.addSubview(money1Label)
        
        money2Label=UILabel(frame:CGRect(x:(screenWidth-0.5)/2+0.5,y:122,width:(screenWidth-0.5)/2,height:24))
        money2Label.textAlignment=NSTextAlignment.center
        money2Label.textColor=UIColor.white
        money2Label.text="¥0.00"
        headerUserView.addSubview(money2Label)

        let titleArr=["提现金额","我的钱包"]
        for index in 0...1 {
            let label=UILabel(frame: CGRect(x: (CGFloat(index) * ((screenWidth-0.5)/2+0.5)), y: 152, width: (screenWidth-0.5)/2, height: 14))
            label.font=UIFont.systemFont(ofSize: 14)
            label.textColor=UIColor.white
            label.textAlignment=NSTextAlignment.center
            label.text="\(titleArr[index])"
            headerUserView.addSubview(label)
        }
    }
    
    
    func creatFunctionView(){
        
        functionView=UIView(frame: CGRect(x:0, y:headerUserView.frame.size.height+headerUserView.frame.origin.y , width:screenWidth, height:screenHeight-headerUserView.frame.size.height-(self.tabBarController?.tabBar.frame.size.height)!-20))
        functionView.isUserInteractionEnabled=true
        functionView.backgroundColor=UIColor.white
        self.view.addSubview(functionView)
        
        let label1=UILabel(frame:CGRect(x:0,y:(functionView.frame.size.height-0.3)/2,width:screenWidth,height:0.3))
        label1.backgroundColor=UIColor.lightGray
        functionView.addSubview(label1)
        
        let label2=UILabel(frame:CGRect(x:(functionView.frame.size.width-0.3)/2,y:0,width:0.3,height:functionView.frame.size.height))
        label2.backgroundColor=UIColor.lightGray
        functionView.addSubview(label2)

        
        let functions=["makeMoney1","makeMoney2","makeMoney3","makeMoney4"]
        let functionTitles=["赚钱吧","免费连网","团友位置","旅游服务"]
        let functionSubTitles=["轻轻一点立马赚","一键连接免费wifi","寻找同行的伙伴吧","导航、酒店"]
        for index in 0...3 {
            //let view=UIView(frame:CGRect(x: tem % index ,y:0,width:(functionView.frame.size.width-0.3)/2,height: (functionView.frame.size.height-0.3)/2 ))

            //x : ((CGFloat(index) % 2) * ((functionView.frame.size.width-0.3)/2+0.4)
            //y : ((CGFloat(index) / 2) * ((functionView.frame.size.height-0.3)/2+0.3)
        }
        

        
    }
    
    
    //底部白色块
    func creatCollectionView(){
        collectView=UIView(frame: CGRect(x: 0, y: headerUserView.frame.size.height, width: screenWidth, height: screenHeight-headerUserView.frame.height-(self.tabBarController?.tabBar.frame.size.height)!))
        collectView.isUserInteractionEnabled=true
        collectView.backgroundColor=UIColor.white
        self.view.addSubview(collectView)
        
        let label=UILabel(frame: CGRect(x: 0, y: 6, width: screenWidth, height: 17))
        label.text="附近其他景区"
        label.textColor=UIColor.lightGray
        label.textAlignment=NSTextAlignment.center
        label.font=UIFont.systemFont(ofSize: 12)
        collectView.addSubview(label)
        
        //创建collectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection=UICollectionViewScrollDirection.horizontal
        layout.itemSize=CGSize(width: (screenWidth-30)/2, height: collectView.frame.height-36)
        collectionView=UICollectionView(frame: CGRect(x: 0, y: 30, width: screenWidth, height: collectView.frame.height-36), collectionViewLayout: layout)
        //注册一个cell
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.backgroundColor=UIColor.white
        collectView.addSubview(collectionView)
    }
    
    /*****************************************UICollectionViewDelegate***********************************************/
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionCell
//        var model = dataArr[indexPath.row]
//        let url : NSURL = NSURL(string: model.image_url as String)
        cell.titleLabel.text="AAAAAA"
        cell.distanceLabel.text="100km"
        cell.contentLabel.text="啊几乎都是卡号多少卡号的卡号阿娇电话卡等哈裤短裤啊好就是坎大哈看到哈萨克很多事看得开大会就开始打瞌睡打客户端看大海肯德基哈萨克大卡的哈就看到哈客户端多哈看见的哈萨克说"
        return cell
    }
    
    
    //按钮方法
    func btnClick(_ btn:UIButton){
        print("点击  \(btn.tag)");
    }
    
}
