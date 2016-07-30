//
//  ViewController.m
//  LocalNotificationDemo
//
//  Created by wanglong on 16/7/30.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** notification */
@property(nonatomic,strong) UILocalNotification *notification;
@end

@implementation ViewController
- (UILocalNotification *)notification
{
    if (_notification == nil) {
        _notification = [[UILocalNotification alloc] init];
    }
    return _notification;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)clickBtn:(UIButton *)sender {
    
    //设置通知时间
    NSDate *pushDate = [NSDate dateWithTimeIntervalSinceNow:10];
    self.notification.fireDate = pushDate;
    self.notification.timeZone = [NSTimeZone defaultTimeZone];
    self.notification.repeatInterval = 0;
//    self.notification.repeatInterval = NSCalendarUnitMinute;
    
    //设置通知内容
    self.notification.alertBody = @"吃饭了!";
    self.notification.alertLaunchImage = @"xingxing11";
    self.notification.alertTitle = @"WeChat";
    
    //设置锁屏状态下滑动底部的文字和hasAction配合使用
    self.notification.alertAction = @"66";
    self.notification.hasAction = NO;
    
    //设置BadgeNumber
    self.notification.applicationIconBadgeNumber = 1;
    
    //设置声音
    self.notification.soundName = UILocalNotificationDefaultSoundName;
    
    //设置其他信息
    NSDictionary *info = [NSDictionary dictionaryWithObject:@"name"forKey:@"key"];
    self.notification.userInfo = info;

    //发送通知
    UIApplication *app = [UIApplication sharedApplication];
    [app scheduleLocalNotification:self.notification];
 
}

@end
