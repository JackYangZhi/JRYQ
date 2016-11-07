//
//  MyBaseMainVC.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/13.
//  Copyright © 2016年 杨星. All rights reserved.
//

import Foundation
import UIKit

class MyBaseMainVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    
    //第一组
    var firstArry = ["头像","昵称","性别","生日"]
    
    //第二组
    var secondArr=["职业","地区","兴趣"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        
        self.title="基本信息"
        
        //设置导航栏颜色
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        //设置标题颜色
        let navigationTitleAttribute : NSDictionary = NSDictionary(object: colorValueRGB("55a6ff"),forKey: NSForegroundColorAttributeName as NSCopying)
        self.navigationController?.navigationBar.titleTextAttributes = (navigationTitleAttribute as! [String : AnyObject])
        //设置返回按钮
        let backBBI=UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem=backBBI
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage=nil
        
        tableView=UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight-(self.navigationController?.navigationBar.frame.size.height)!-20), style: UITableViewStyle.plain)
        tableView.delegate=self
        tableView.dataSource=self
        //创建cell
        tableView.register(UINib(nibName: "MyBaseMainCell",bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.tableFooterView=UIView.init()
        self.view.addSubview(tableView)
    }
    
    //分组个数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==0{
            return 0
        }
        else{
            return 10
        }
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return firstArry.count
        }
        else{
            return secondArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat
        if((indexPath as NSIndexPath).section==0){
            if((indexPath as NSIndexPath).row==0){
                height=90
            }else{
                height=50
            }
        }else{
            height=50
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyBaseMainCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyBaseMainCell
        
        cell.layoutMargins=UIEdgeInsets.zero;
        
        if((indexPath as NSIndexPath).section==0){
            cell.titleLabel.text="\(self.firstArry[(indexPath as NSIndexPath).row])"
            if((indexPath as NSIndexPath).row==0){
                cell.photoImageView.backgroundColor=UIColor.red;
                cell.photoImageView.isUserInteractionEnabled=true;
                cell.photoImageView.contentMode=UIViewContentMode.scaleAspectFill
                cell.photoImageView.clipsToBounds=true
                cell.photoImageView.layer.shadowColor = UIColor.clear.cgColor
                cell.photoImageView.layer.shadowOffset = CGSize(width: 4, height: 4)
                cell.photoImageView.layer.shadowOpacity = 0.5
                cell.photoImageView.layer.shadowRadius = 2.0
                cell.photoImageView.layer.borderColor = UIColor.white.cgColor
                cell.photoImageView.layer.borderWidth = 2.0
                cell.photoImageView.layer.masksToBounds = true
                cell.photoImageView.layer.cornerRadius=cell.photoImageView.frame.size.height/2
                cell.photoImageView.image=UIImage(named: "photo")
            }
            cell.contentLabel.text="内容"
        }else{
            cell.titleLabel.text="\(self.secondArr[(indexPath as NSIndexPath).row])"
            cell.contentLabel.text="内容"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
        tableView.deselectRow(at: indexPath, animated: true)
        print("\((indexPath as NSIndexPath).row)")
        
        if((indexPath as NSIndexPath).section==0){
            if((indexPath as NSIndexPath).row==0){
                let setPhotoVC=SetPhotoVC()
                self.navigationController?.pushViewController(setPhotoVC, animated: true)
            }
        }
        
    }

}
