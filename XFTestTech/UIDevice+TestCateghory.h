//
//  UIDevice+TestCateghory.h
//  TestTech
//
//  Created by HelloBoy on 2018/4/3.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIDevice (TestCateghory)
/// 屏幕宽度
+ (CGFloat)getDeviceScreenWidth;
// 屏幕高度
+ (CGFloat)getDeviceScreenHeight;
/// 获取iPhone名称
+ (NSString *)getiPhoneName;
/// 获取app版本号
+ (NSString *)getAPPVerion;

/// 获取电池电量
+ (CGFloat)getBatteryLevel;
/// 当前系统名称
+ (NSString *)getSystemName;
/// 当前系统版本号
+ (NSString *)getSystemVersion;
+ (NSString *)getUUID;
@end
