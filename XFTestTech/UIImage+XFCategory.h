//
//  UIImage+XFCategory.h
//  TestTech
//
//  Created by HelloBoy on 2018/2/27.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kDefaultWidth 200
#define kDefaultHeight 200

typedef NS_ENUM(NSInteger, WHGradientDirection) {
    WHLinearGradientDirectionLevel,                 //AC - BD
    WHLinearGradientDirectionVertical,              //AB - CD
    WHLinearGradientDirectionUpwardDiagonalLine,    //A - D
    WHLinearGradientDirectionDownDiagonalLine,      //C - B
};
//      A         B
//       _________
//      |         |
//      |         |
//       ---------
//     C          D
@interface UIImage (XFCategory)
/**
 *  返回指定颜色生成的图片
 *  @param color 颜色
 *  @param size  尺寸
 */
+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size;
/**
 *  rect 获取指定尺寸（50*50）的图片
 *  @param color 图片颜色
 *  @param name  文本,居中显示
 */
+ (UIImage *)imageWithColor:(UIColor *)color Name:(NSString *)name Frame:(CGRect)rect;
/// 对图片进行模糊处理
+ (UIImage *)gaussianBlurImage:(UIImage *)image andInputRadius:(CGFloat)radius;
/// 由颜色生成模糊图片
+ (UIImage *)gaussianBlurImageWithColor:(UIColor *)color andSize:(CGSize)size andInputRadius:(CGFloat)radius;



#pragma mark - Cut
//UIImage等比例缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize;
//UIImage自定长宽缩放
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
/*
 *  直接截屏
 */
+ (UIImage *)cutScreen;

/**
 *  从给定UIView中截图：UIView转UIImage
 */
+ (UIImage *)cutFromView:(UIView *)view;

/**
 *  从给定UIImage和指定Frame截图：
 */
- (UIImage *)cutWithFrame:(CGRect)frame;
/**
 *  图片剪切为圆形
 *  @return 剪切后的圆形图片
 */
- (UIImage *)roundImage;



// 线性渐变
+ (UIImage *)getLinearGradientImage:(UIColor *)startColor and:(UIColor *)endColor directionType:(WHGradientDirection)directionType;/* CGSizeMake(kDefaultWidth, kDefaultHeight) */
+ (UIImage *)getLinearGradientImage:(UIColor *)startColor and:(UIColor *)endColor directionType:(WHGradientDirection)directionType option:(CGSize)size;

// 圆形渐变
+ (UIImage *)getRadialGradientImage:(UIColor *)centerColor and:(UIColor *)outColor;/* raduis = kDefaultWidth / 2 */
+ (UIImage *)getRadialGradientImage:(UIColor *)centerColor and:(UIColor *)outColor option:(CGSize)size;


//   ChromatoAnimation
+ (void)addGradientChromatoAnimation:(UIView *)view;
//   LableText LinearGradient and ChromatoAnimation
+ (void)addLinearGradientForLableText:(UIView *)parentView lable:(UILabel *)lable start:(UIColor *)startColor and:(UIColor *)endColor;  /* don't need call 'addSubview:' for lable */
+ (void)addGradientChromatoAnimationForLableText:(UIView *)parentView lable:(UILabel *)lable; /* don't need call 'addSubview:' for lable */



@end
