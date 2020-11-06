//
//  UITextField+TestCategory.h
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TestCategory)
+ (UITextField *)XF_TextFieldColor:(UIColor *)color Placeholder:(NSString *)placeholder
                              Font:(UIFont *)font TextColor:(UIColor *)textColor
                             Frame:(CGRect)frame;
@end
