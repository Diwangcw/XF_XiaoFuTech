//
//  UIButton+TestCategory.h
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TestCategory)
///快速创建一个Button, 所有参数都可以填nil
+ (UIButton *)XF_ButtonWithColor:(UIColor *)color Image:(NSString *)image Title:(NSString *)title Font:(UIFont *)font TitleColor:(UIColor *)titleColor Target:(id)target Action:(SEL)action Frame:(CGRect)frame;

//设置Button的背景色
/*
 btn1.backgroundColor = [UIColor greenColor]; //注意,这里的默认背景色必须设置, 仅仅通过下一行暂时不能设置初始的背景色
 [btn1 setBackgroundColor:[UIColor greenColor] forState:UIControlStateNormal];
 [btn1 setBackgroundColor:[UIColor blueColor] forState:UIControlStateHighlighted];
*/
- (void)xf_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

///设置虚线边框，因为需要Button的Size，所以，方法调用必须在Button的Frame设置之后 DashPattren 切圆角
- (void)xf_SetDashLineBorderWidth:(CGFloat)borderWidth BorderColor:(UIColor *)borderColor DashPattren:(CGFloat)dashPattern IsRound:(BOOL)isRound;


///设置Button的背景色，采用将颜色转换为图片的方法，因为需要Button的Size，所以，方法调用必须在Button的Frame设置之后
- (void)xf_SetBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
@end
