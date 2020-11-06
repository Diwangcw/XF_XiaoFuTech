//
//  UILabel+TestCategory.h
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TestCategory)
+ (UILabel *)XF_LabelWithColor:(UIColor *)color Text:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor Frame:(CGRect)frame;
@end
