//
//  UIDevice+TestCateghory.m
//  TestTech
//
//  Created by HelloBoy on 2018/4/3.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UIDevice+TestCateghory.h"

@implementation UIDevice (TestCateghory)


+ (CGFloat)getDeviceScreenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}
// 屏幕高度
+ (CGFloat)getDeviceScreenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}
/// 获取iPhone名称
+ (NSString *)getiPhoneName{
    return [UIDevice currentDevice].name;
}
/// 获取app版本号
+ (NSString *)getAPPVerion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/// 获取电池电量
+ (CGFloat)getBatteryLevel{
    return [UIDevice currentDevice].batteryLevel;
}
/// 当前系统名称
+ (NSString *)getSystemName{
    return [UIDevice currentDevice].systemName;
}
/// 当前系统版本号
+ (NSString *)getSystemVersion{
    return [UIDevice currentDevice].systemVersion;
}
+ (NSString *)getUUID{
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}

@end
