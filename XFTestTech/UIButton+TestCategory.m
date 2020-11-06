//
//  UIButton+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/26.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UIButton+TestCategory.h"
#import <objc/runtime.h>

@interface UIButton (TestCategory)

@property (nonatomic, strong) NSMutableDictionary *cs_dictBackgroundColor;
@end

@implementation UIButton (TestCategory)

static const NSString *key_cs_backgroundColor             = @"key_cs_backgroundColor";

static NSString *cs_stringForUIControlStateNormal         = @"cs_stringForUIControlStateNormal";
static NSString *cs_stringForUIControlStateHighlighted    = @"cs_stringForUIControlStateHighlighted";
static NSString *cs_stringForUIControlStateDisabled       = @"cs_stringForUIControlStateDisabled";
static NSString *cs_stringForUIControlStateSelected       = @"cs_stringForUIControlStateSelected";

///快速创建一个Button, 所有参数都可以填nil
+ (UIButton *)XF_ButtonWithColor:(UIColor *)color Image:(NSString *)image Title:(NSString *)title Font:(UIFont *)font TitleColor:(UIColor *)titleColor Target:(id)target Action:(SEL)action Frame:(CGRect)frame {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.backgroundColor = color;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn.titleLabel setFont:font];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - cs_dictBackgroundColor
- (NSMutableDictionary *)cs_dictBackgroundColor {
    return objc_getAssociatedObject(self, &key_cs_backgroundColor);
}
- (void)setCs_dictBackgroundColor:(NSMutableDictionary *)cs_dictBackgroundColor {
    objc_setAssociatedObject(self, &key_cs_backgroundColor, cs_dictBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)xf_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    if (!self.cs_dictBackgroundColor) {
        self.cs_dictBackgroundColor = [[NSMutableDictionary alloc] init];
    }
    [self.cs_dictBackgroundColor setObject:backgroundColor forKey:[self cs_stringForUIControlState:state]];
}

- (NSString *)cs_stringForUIControlState:(UIControlState)state {
    NSString *cs_string;
    switch (state) {
        case UIControlStateNormal:
            cs_string = cs_stringForUIControlStateNormal;
              break;
        case UIControlStateHighlighted:
            cs_string = cs_stringForUIControlStateHighlighted;
            break;
        case UIControlStateDisabled:
            cs_string = cs_stringForUIControlStateDisabled;
            break;
        case UIControlStateSelected:
            cs_string = cs_stringForUIControlStateSelected;
            break;
        default:
            cs_string = cs_stringForUIControlStateNormal;
            break;
    }
    return cs_string;
}

#pragma mark - highlighted
- (void)setHighlighted:(BOOL)highlighted {
    if (highlighted) {
        self.backgroundColor = (UIColor *)[self.cs_dictBackgroundColor objectForKey:cs_stringForUIControlStateHighlighted];
    } else {
        self.backgroundColor = (UIColor *)[self.cs_dictBackgroundColor objectForKey:cs_stringForUIControlStateNormal];
    }
}
#pragma mark - 虚线
- (void)xf_SetDashLineBorderWidth:(CGFloat)borderWidth BorderColor:(UIColor *)borderColor DashPattren:(CGFloat)dashPattern IsRound:(BOOL)isRound{
    CAShapeLayer *border = [CAShapeLayer layer];
    //虚线的颜色
    border.strokeColor = borderColor.CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:dashPattern];
    //设置路径
    border.path = path.CGPath;
    border.frame = self.bounds;
    //虚线的宽度
    border.lineWidth = borderWidth;
    //虚线的间隔
    border.lineDashPattern = @[@4, @2];
    self.layer.cornerRadius = dashPattern;
    self.layer.masksToBounds = isRound;
    [self.layer addSublayer:border];
}


///调用此方法必须先设置按钮的Frame
- (void)xf_SetBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton XF_ImageWithColor:backgroundColor size:self.bounds.size] forState:state];
}

+ (UIImage *)XF_ImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
