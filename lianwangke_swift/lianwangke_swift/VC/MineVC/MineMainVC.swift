//
//  MineMainVC.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/6.
//  Copyright © 2016年 杨星. All rights reserved.
//

import Foundation
import UIKit

class MineMainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,ParallaxHeaderViewDelegate {
    
    var headerImageView : UIImageView!
    
    var tableView : UITableView!
    
    var photoImageView : UIImageView!
    
    var nameLabel : UILabel!
    
    var money1 : UILabel!
    
    var money2 : UILabel!
    
    //第一组
    var firstArry = ["收货地址","支付宝账号","手机号"]
    
    //第二组
    var secondArr=["设置","检查更新","关于我们",""]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        self.navigationController!.navigationBar.translucent=false;
//        self.navigationController?.navigationBar.barTintColor=colorValueRGB("55A6FF")
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        
//        self.navigationController?.navigationBar.setMyBackgroundColor(UIColor(red: 0/255.0, green: 130/255.0, blue: 210/255.0, alpha: 0))
//        
//        let backBBI=UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem=backBBI
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage=UIImage()
        
        self.navigationController?.navigationBar.isHidden=false
        //设置导航栏全透明
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.setMyBackgroundColor(UIColor(red: 0/255.0, green: 130/255.0, blue: 210/255.0, alpha: 0))
        let backBBI=UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem=backBBI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="个人中心"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.navigationController?.navigationBar.setMyBackgroundColor(UIColor(red: 0/255.0, green: 130/255.0, blue: 210/255.0, alpha: 0))

        let backBBI=UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem=backBBI
        
        tableView=UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), style: UITableViewStyle.plain)
        tableView.delegate=self
        tableView.dataSource=self
        //创建cell
        tableView.register(UINib(nibName: "MineCell",bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.tableFooterView=UIView.init()
        self.view.addSubview(tableView)
        
        headerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 180))
        headerImageView.image = UIImage(named: "MySelf")
        headerImageView.isUserInteractionEnabled=true
        //headerImageView.backgroundColor=colorValueRGB("55A6FF")
        headerImageView.contentMode = .scaleAspectFill
        
        self.creatTopView()
        
        let heardView = ParallaxHeaderView(style: .default, subView: headerImageView, headerViewSize: CGSize(width: tableView.bounds.width, height: 180), maxOffsetY: -180, delegate: self)
        
        self.tableView.tableHeaderView = heardView
        
    }
    
    
    func creatTopView(){
        photoImageView=UIImageView(frame: CGRect(x: 19, y: 90, width: 68, height: 68))
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
        //photoImageView.backgroundColor=UIColor(patternImage: UIImage(named: "photo")!)
        photoImageView.image=UIImage(named: "photo")
        headerImageView.addSubview(photoImageView)
        
        nameLabel=UILabel(frame: CGRect(x: photoImageView.frame.width+30, y: 90, width: screenWidth-(photoImageView.frame.width+30), height: 18))
        nameLabel.font=UIFont.systemFont(ofSize: 18)
        nameLabel.textColor=UIColor.white
        nameLabel.text="杨星"
        headerImageView.addSubview(nameLabel)
        
        let titleArr=["余额","绑定余额"]
        let moneyArr=["123456","789010"]
        let moneyWidth=(screenWidth-(photoImageView.frame.width+80))/2
        for index in 0...1 {
            let label=UILabel(frame: CGRect(x: photoImageView.frame.width+30 + (CGFloat(index) * (moneyWidth+20)), y: nameLabel.frame.height+106, width: moneyWidth, height: 12))
            label.font=UIFont.systemFont(ofSize: 12)
            label.textColor=UIColor.white
            label.text="\(titleArr[index])"
            headerImageView.addSubview(label)
            
            let label2=UILabel(frame: CGRect(x: photoImageView.frame.width+30 + (CGFloat(index) * (moneyWidth+20)), y: label.frame.origin.y+label.frame.height+8, width: moneyWidth, height: 16))
            label2.font=UIFont.systemFont(ofSize: 16)
            label2.textColor=UIColor.white
            label2.tag=index+10
            label2.text="\(moneyArr[index])"
            headerImageView.addSubview(label2)
        }

        let labelbg=UILabel(frame: CGRect(x: photoImageView.frame.width+30 + moneyWidth+9, y: nameLabel.frame.height+106, width: 1, height: 34))
        labelbg.backgroundColor=UIColor.white
        headerImageView.addSubview(labelbg)
        
        let btn=UIButton(type: UIButtonType.custom)
        btn.frame=CGRect(x: screenWidth-40, y: nameLabel.frame.height+86, width: 40, height: 55)
        btn.setImage(UIImage(named: "MineBtn"), for: UIControlState())
        btn.addTarget(self, action: #selector(MineMainVC.btnClick), for: UIControlEvents.touchUpInside)
        headerImageView.addSubview(btn)
        
//        let labelN1 = self.view.viewWithTag(10) as! UILabel
//        let labelN2 = self.view.viewWithTag(11) as! UILabel

    }
    
    func btnClick(){
        print("11")
        let myBaseVC=MyBaseMainVC()
        myBaseVC.hidesBottomBarWhenPushed=true
        self.navigationController?.pushViewController(myBaseVC, animated: true)
    }
    
    
    /**********************************UITableViewDelegate**************************************/
    //分组个数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==0{
            return 0
        }
        else{
            return 22
        }
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 3
        }
        else{
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
    
    //脚视图 主要去掉最后一行的分割线
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MineCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MineCell

        cell.layoutMargins=UIEdgeInsets.zero;
        
        if((indexPath as NSIndexPath).section==0){
            if(self.firstArry.count>0){
                cell.titleLabel.text="\(self.firstArry[(indexPath as NSIndexPath).row])"
            }
        }else{
            if(self.secondArr.count>0){
                cell.titleLabel.text="\(self.secondArr[(indexPath as NSIndexPath).row])"
                if((indexPath as NSIndexPath).row != 0  && (indexPath as NSIndexPath).row != 3){
                    cell.titleLabel.textColor=colorValueRGB("55A6FF")
                }
                if((indexPath as NSIndexPath).row==3){
                    cell.exitLabel.text="退出登录"
                    cell.acceImageView.isHidden=true
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
        tableView.deselectRow(at: indexPath, animated: true)
        print("\((indexPath as NSIndexPath).row)")
        if((indexPath as NSIndexPath).section==0){
            if((indexPath as NSIndexPath).row==0){
                let testVC=TestVC()
                testVC.hidesBottomBarWhenPushed=true
                self.navigationController?.pushViewController(testVC, animated: true)
            }
            else if((indexPath as NSIndexPath).row==1){
                

                let mapVC=MapViewController()
                mapVC.hidesBottomBarWhenPushed=true
                self.navigationController?.pushViewController(mapVC, animated: true)
            }
        }
    }

    
    /****************************************弹性渐变*****************************************/
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let heardView = self.tableView.tableHeaderView as! ParallaxHeaderView
        heardView.layoutHeaderViewWhenScroll(scrollView.contentOffset)
        
        //let color = UIColor(red: 0/255.0, green: 130/255.0, blue: 210/255.0, alpha: 1)
        let color=colorValueRGB("55A6FF")//渐变颜色
        let offsetY = scrollView.contentOffset.y
        //let prelude: CGFloat = 50控制渐变高度
        let prelude: CGFloat = 180 - 64
        
        if offsetY >= -64 {//开始渐变
            let alpha = min(1, (64 + offsetY) / (64 + prelude))
            //NavBar透明度渐变
            self.navigationController?.navigationBar.setMyBackgroundColor(color.withAlphaComponent(alpha))
        } else {
            self.navigationController?.navigationBar.setMyBackgroundColor(color.withAlphaComponent(0))
        }
    }
    
    //代理协议
    func LockScorllView(_ maxOffsetY: CGFloat) {
        print("----\(maxOffsetY)")
    }
    
    func autoAdjustNavigationBarAplha(_ aplha: CGFloat) {
        print("----\(aplha)")
    }
    
    //设置分割线顶头
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsets.zero
        }
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }
    
}
