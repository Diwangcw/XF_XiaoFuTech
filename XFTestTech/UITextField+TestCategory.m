

//
//  UITextField+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UITextField+TestCategory.h"

@implementation UITextField (TestCategory)
+ (UITextField *)XF_TextFieldColor:(UIColor *)color Placeholder:(NSString *)placeholder
                              Font:(UIFont *)font TextColor:(UIColor *)textColor
                             Frame:(CGRect)frame {
    UITextField *field = [[UITextField alloc] initWithFrame:frame];
    field.backgroundColor = color;
    field.placeholder = placeholder;
    field.font = font;
    field.textColor = textColor;
    return field;
}
@end
