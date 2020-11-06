//
//  UITextView+TestCategory.h
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (TestCategory)
+ (UITextView *)XF_TextViewColor:(UIColor *)color Font:(UIFont *)font
                       TextColor:(UIColor *)textColor Frame:(CGRect)frame;

@end
