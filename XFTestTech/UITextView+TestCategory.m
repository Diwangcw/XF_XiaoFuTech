//
//  UITextView+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UITextView+TestCategory.h"

@implementation UITextView (TestCategory)
+ (UITextView *)XF_TextViewColor:(UIColor *)color Font:(UIFont *)font
                       TextColor:(UIColor *)textColor Frame:(CGRect)frame {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = color;
    textView.font = font;
    textView.textColor = textColor;
    return textView;
}
@end
