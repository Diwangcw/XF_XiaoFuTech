//
//  UIView+TestCategory.h
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TestCategory)
+ (UIView *)XF_ViewWithColor:(UIColor *)color Frame:(CGRect)frame;



///找到承载当前视图的控制器
- (UIViewController *)xf_FindViewController;


#pragma mark - basics
- (CGFloat)xf_GetX;
- (CGFloat)xf_GetY;
- (CGFloat)xf_GetWidth;
- (CGFloat)xf_GetHeight;
- (CGFloat)xf_GetCenterX;
- (CGFloat)xf_GetCenterY;
- (CGFloat)xf_GetTop;
- (CGFloat)xf_GetBottom;
- (CGFloat)xf_GetLeft;
- (CGFloat)xf_GetRight;

- (void)xf_SetX:(CGFloat)x;
- (void)xf_SetY:(CGFloat)y;
- (void)xf_SetWidth:(CGFloat)width;
- (void)xf_SetHeight:(CGFloat)height;
@end
