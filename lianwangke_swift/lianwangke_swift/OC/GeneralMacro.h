//
//  GeneralMacro.h
//  bangke
//
//  Created by 杨星 on 15/7/7.
//  Copyright (c) 2015年 杨星. All rights reserved.
//

#define Version [[UIDevice currentDevice].systemVersion floatValue]

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#define TimeError @"" //超时

#define DEFAULT_PAGE_SIZE 10

#define colorWithRGB(rgbValue,alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:alphaValue]



/* Background Task */
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_0
#define CBBeginBackgroundTask() \
UIBackgroundTaskIdentifier taskID = UIBackgroundTaskInvalid; \
taskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{ \
[[UIApplication sharedApplication] endBackgroundTask:taskID]; }];

#define CBEndBackgroundTask() \
[[UIApplication sharedApplication] endBackgroundTask:taskID];

#else

#define CBBeginBackgroundTask()
#define CBEndBackgroundTask()

#endif
