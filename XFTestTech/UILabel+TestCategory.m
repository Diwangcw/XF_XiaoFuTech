
//
//  UILabel+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UILabel+TestCategory.h"

@implementation UILabel (TestCategory)
+ (UILabel *)XF_LabelWithColor:(UIColor *)color Text:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor Frame:(CGRect)frame {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = color;
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    return label;
}
@end
