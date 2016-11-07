//
//  MapViewController.h
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/18.
//  Copyright © 2016年 杨星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "GeneralMacro.h"


@interface MapViewController : UIViewController<MAMapViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    //顶部显示位置
    UIView *_topView;
    UILabel *_locationLabel;
    
    //tableView
    UITableView *_tableView;
    //滑动呈现的动画
    UIView *_myNavView;
    
}

@property (nonatomic, strong) MAMapView *mapView;


- (void)returnAction;

/**
 *  hook,子类覆盖它,实现想要在viewDidAppear中执行一次的方法,搜索中有用到
 */
- (void)hookAction;

//- (NSString *)getApplicationName;
//- (NSString *)getApplicationScheme;


@end
