//
//  AppDelegate.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/1/5.
//  Copyright © 2016年 杨星. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MAMapViewDelegate {

    var window: UIWindow?

    var time : NSNumber!
    
    var timeSever : NSNumber!
    
    var timeOut : NSNumber!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //AMapServices.sharedServices().apiKey = "51f03e8b6f8e45feba7d08a60fe9ba32"

        
        self.window=UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor=UIColor.white
        self.window?.makeKey()
        
//        //导航栏背景颜色
//        UINavigationBar.appearance().backgroundColor=colorValueRGB("#55A6FF")
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(CGFloat(NSInteger.min),CGFloat(NSInteger.min)), forBarMetrics:UIBarMetrics.Default);
//        //导航栏标题文字颜色
//        UINavigationBar.appearance().titleTextAttributes=NSDictionary(object:UIColor.whiteColor(), forKey:NSForegroundColorAttributeName) as? [String : AnyObject]
//        //将状态栏变为白色
//        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
//        //设置返回按钮颜色
//        UINavigationBar.appearance().tintColor=UIColor.whiteColor();
        
        
        //获取时间戳
        let date = Date()
        let timeInterval = date.timeIntervalSince1970 * 1000
        //self.time=round(timeInterval)
        print("时间戳 is \(self.time)")
        
        //网络请求
        //self.creatRequestData()
        
        
        Test.someType();

        
        
        let mainTabVC=MainTabBarVC()
        self.window?.rootViewController=mainTabVC
        
        return true
    }
    
    /*
    func requestData(){
        
        //无参数
        Alamofire.request(.GET,"http://httpbin.org/get")
        
        //带参数
        //Alamofire.request(.GET, "http://httpbin.org/get",parameters: ["foo":"bar"])
        
        
    }
    
    func creatRequestData(){
        
        Alamofire.request(.GET, HOSTADDRESS + ServerTime, parameters: nil)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    let state=JSON.object(forKey: "state")?.int32Value//转int
                    print("state is \(state)")
                    if state==0 {
                        let str =  JSON.object(forKey: "time")
                        print("str is \(str)");
                        self.timeSever=str?.doubleValue;
                        print("timerSever is \(self.timeSever)")
                        self.timeOut=self.time.doubleValue - self.timeSever.doubleValue
                        print("timeOut is \(self.timeOut)")
                        userDefault.set(self.timeOut.stringValue, forKey: "time")
                        print("存储的时间  is \(userDefault.object(forKey: "time"))")
                        
                        //把服务器的时间戳转化为时间
                        let timeSta:TimeInterval = self.timeSever!.doubleValue/1000.0
                        let dfmatter = DateFormatter()
                        dfmatter.dateFormat="yyyy-MM-dd HH:mm"
                        let date = Date(timeIntervalSince1970: timeSta)
                        print("转化为时间 is \(dfmatter.string(from: date))")
                        
                        
                    }else{
                        print("Error")
                    }
                }
        }
        
    }
*/

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

