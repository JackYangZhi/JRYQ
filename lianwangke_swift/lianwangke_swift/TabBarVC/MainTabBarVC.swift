//
//  MainTabBarVC.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/6.
//  Copyright © 2016年 杨星. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeMainVC()
        let navHome=UINavigationController(rootViewController: homeVC)
        navHome.title="home"
        navHome.tabBarItem.image=UIImage(named: "tab1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navHome.tabBarItem.selectedImage=UIImage(named: "tabS1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let networkVC=NetWorkMainVC()
        let navNetwork=UINavigationController(rootViewController: networkVC)
        navNetwork.title="network"
        navNetwork.tabBarItem.image=UIImage(named: "tab2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navNetwork.tabBarItem.selectedImage=UIImage(named: "tabS2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let orderVC=OrderMainVC()
        let navOrder=UINavigationController(rootViewController: orderVC)
        navOrder.title="order"
        navOrder.tabBarItem.image=UIImage(named: "tab3")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navOrder.tabBarItem.selectedImage=UIImage(named: "tabS3")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let mineVC=MineMainVC()
        let navMine=UINavigationController(rootViewController: mineVC)
        navMine.title="mine"
        navMine.tabBarItem.image=UIImage(named: "tab4")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navMine.tabBarItem.selectedImage=UIImage(named: "tabS4")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let vcS=[navHome,navNetwork,navOrder,navMine]
        self.viewControllers=vcS
        
        //自定义工具栏
        self.tabBar.backgroundColor=UIColor.clear
        //底部工具栏背景颜色
        //self.tabBar.barTintColor=UIColor.greenColor()
        //设置底部工具栏文字颜色（默认状态和选中状态）
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object: UIColor.lightGray,forKey: NSForegroundColorAttributeName as NSCopying) as? [String:AnyObject], for: UIControlState())
        //colorValueRGB("#FF55A6FF")
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object: colorValueRGB("#55A6FF"), forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for:UIControlState.selected)
    }
}
