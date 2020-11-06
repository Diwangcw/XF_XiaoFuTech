//
//  UIScrollView+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UIScrollView+TestCategory.h"

@implementation UIScrollView (TestCategory)
+ (UIScrollView *)XF_ScrollViewWithColor:(UIColor *)color Frame:(CGRect)frame {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.backgroundColor = color;
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    return scrollView;
}
@end
