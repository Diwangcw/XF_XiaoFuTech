//
//  XFTestTech.h
//  XFTestTech
//
//  Created by HelloBoy on 2019/2/19.
//  Copyright © 2019 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for XFTestTech.
FOUNDATION_EXPORT double XFTestTechVersionNumber;

//! Project version string for XFTestTech.
FOUNDATION_EXPORT const unsigned char XFTestTechVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <XFTestTech/PublicHeader.h>

#import "NSObject+TestCategory.h"
#import "UILabel+TestCategory.h"
#import "UIButton+TestCategory.h"
#import "UITextField+TestCategory.h"
#import "UITextView+TestCategory.h"
#import "UIImage+XFCategory.h"
#import "UIView+TestCategory.h"
#import "UIScrollView+TestCategory.h"
#import "TestNavigationViewController.h"
#import "TestReduceTableView.h"
#import "TestNSUserDefault.h"
#import "UIDevice+TestCateghory.h"
#import "TestQuickHelper.h"
#import "TestKeyChainManager.h"
#import "NSDate+TestCategory.h"
#import "TestBaseViewController.h"

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark - 颜色+字体
#define XFColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define XFRGBA_Color(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define XFColor(rgbValue, alpha)    XFColorFromRGBA(rgbValue, alpha)
#define XFFont(fontSize) [UIFont systemFontOfSize:fontSize]
#define XFWidth [UIScreen mainScreen].bounds.size.width
#define XFHeight [UIScreen mainScreen].bounds.size.height

#pragma mark - 其它
#define XFiOSValidSys(sysVersion) @available(iOS sysVersion, *)
#define XFWeakSelf(weakSelf)  __weak __typeof(&*self) weakSelf = self;
#define XFWeakObject(obj, weakObj) __weak __typeof(&*obj) weakObj = obj;
#define XFBlockObject(obj, blockObj) __block __typeof(&*obj) blockObj = obj;

// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator高度
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

