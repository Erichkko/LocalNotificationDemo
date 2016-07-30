//
//  AppDelegate.m
//  LocalNotificationDemo
//
//  Created by wanglong on 16/7/30.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置接收本地通知
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:nil];
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        [application registerUserNotificationSettings:settings];
    }

    
    #warning  当程序已经被杀死并且不是通过icon图标启动的时候 launchOptions值就不会为空
    #warning  可以通过此字典中的info信息判断何种启动方式并且做相应的操作
    /**
     * NSString *const UIApplicationLaunchOptionsURLKey;
     NSString *const UIApplicationLaunchOptionsSourceApplicationKey;
     NSString *const UIApplicationLaunchOptionsRemoteNotificationKey;
     NSString *const UIApplicationLaunchOptionsLocalNotificationKey;
     NSString *const UIApplicationLaunchOptionsAnnotationKey;
     NSString *const UIApplicationLaunchOptionsLocationKey;
     NSString *const UIApplicationLaunchOptionsNewsstandDownloadsKey;
     NSString *const UIApplicationLaunchOptionsBluetoothCentralsKey;
     NSString *const UIApplicationLaunchOptionsBluetoothPeripheralsKey;
     NSString *const UIApplicationLaunchOptionsShortcutItemKey;
     NSString *const UIApplicationLaunchOptionsUserActivityDictionaryKey;
     NSString *const UIApplicationLaunchOptionsUserActivityTypeKey;
     */
    //查看启动参数
    NSLog(@"launchOptions == %@",launchOptions);
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 300, 400, 200);
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor yellowColor];
    label.text = [NSString stringWithFormat:@"label == %@",launchOptions];
    [self.window.rootViewController.view addSubview:label];
    
    
    //判断
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        //做本地通知的相应操作,跳转到对应的页面
    }
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:100];
}

#warning  如何程序已经死了就不会调用此方法
/**
 *  当应用程序进入前台,或者在前台的时候就会执行该方法(只不过在前台时通知不显示出来,但任然会收到通知)
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"notification == %@",notification);
    /**
     *     UIApplicationStateActive,
     UIApplicationStateInactive,
     UIApplicationStateBackground
     */
    if (application.applicationState == UIApplicationStateInactive) {
        NSLog(@"UIApplicationStateInactive");
        
//        UIView *redView =[[UIView alloc] init];
//        redView.frame = CGRectMake(0, 0, 100, 100);
//        redView.backgroundColor = [UIColor redColor];
//        [self.window.rootViewController.view addSubview:redView];
    }else{
        NSLog(@"UIApplicationStateActive");
    }
}

@end
