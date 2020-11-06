
//
//  UIView+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UIView+TestCategory.h"

@implementation UIView (TestCategory)
+ (UIView *)XF_ViewWithColor:(UIColor *)color Frame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}


- (UIViewController *)xf_FindViewController{
    
    UIWindow *keyWindow  = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = keyWindow.rootViewController;

    while (vc.presentedViewController)
    {
        vc = vc.presentedViewController;
        
        if ([vc isKindOfClass:[UINavigationController class]])
        {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        else if ([vc isKindOfClass:[UITabBarController class]])
        {
            vc = [(UITabBarController *)vc selectedViewController];
        }
    }
    return vc;
    
//    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
//    UIViewController *parent = rootVC;
//    while ((parent = rootVC.presentedViewController) != nil ) {
//        rootVC = parent;
//    }
//
//    while ([rootVC isKindOfClass:[UINavigationController class]]) {
//        rootVC = [(UINavigationController *)rootVC topViewController];
//    }
//    return rootVC;
}


#pragma mark - basics
- (CGFloat)xf_GetX{
    return self.frame.origin.x;
}
- (CGFloat)xf_GetY{
    return self.frame.origin.y;
}
- (CGFloat)xf_GetWidth{
    return self.frame.size.width;
}
- (CGFloat)xf_GetHeight{
    return self.frame.size.height;
}
- (CGFloat)xf_GetCenterX{
    return self.center.x;
}
- (CGFloat)xf_GetCenterY{
    return self.center.y;
}

- (CGFloat)xf_GetTop{
    return CGRectGetMinY(self.frame);
}
- (CGFloat)xf_GetBottom{
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)xf_GetLeft{
    return CGRectGetMinX(self.frame);
}
- (CGFloat)xf_GetRight{
    return CGRectGetMaxX(self.frame);
}



- (void)xf_SetX:(CGFloat)x{
    CGRect xframe = self.frame;
    xframe.origin.x = x;
    self.frame = xframe;
}
- (void)xf_SetY:(CGFloat)y{
    CGRect yframe = self.frame;
    yframe.origin.y = y;
    self.frame = yframe;
}
- (void)xf_SetWidth:(CGFloat)width{
    CGRect wFrame = self.frame;
    wFrame.size.width = width;
    self.frame = wFrame;
}
- (void)xf_SetHeight:(CGFloat)height{
    CGRect hFrame = self.frame;
    hFrame.size.height = height;
    self.frame = hFrame;
}

@end
