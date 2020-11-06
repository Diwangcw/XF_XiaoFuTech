//
//  UIImage+XFCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/27.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "UIImage+XFCategory.h"
#define UIColorFronHSB(h,s,b) [UIColor colorWithHue:h saturation:s brightness:b alpha:1.0f]
@implementation UIImage (XFCategory)

+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)imageWithColor:(UIColor *)color Name:(NSString *)name Frame:(CGRect)rect {
    //    CGRect rect = CGRectMake(0, 0, 50, 50);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    [name drawAtPoint:CGPointMake(10, 15) withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]}];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
/// 对图片进行模糊处理
+ (UIImage *)gaussianBlurImage:(UIImage *)image andInputRadius:(CGFloat)radius {
    if (!image) {
        return nil;
    }
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}
+ (UIImage *)gaussianBlurImageWithColor:(UIColor *)color andSize:(CGSize)size andInputRadius:(CGFloat)radius {
    UIImage *image = [UIImage imageWithColor:color Size:size];
    if (image) {
        return [UIImage gaussianBlurImage:image andInputRadius:radius];
    }else {
        return nil;
    }
}


+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
//UIImage自定长宽缩放
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

#pragma mark - Cut
+ (UIImage *)cutScreen{
    return [self cutFromView:[UIApplication sharedApplication].keyWindow];
}

+ (UIImage *)cutFromView:(UIView *)view {
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //在新建的图形上下文中渲染view的layer
    [view.layer renderInContext:context];
    [[UIColor clearColor] setFill];
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)cutWithFrame:(CGRect)frame {
    //创建CGImage
    CGImageRef cgimage = CGImageCreateWithImageInRect(self.CGImage, frame);
    //创建image
    UIImage *newImage=[UIImage imageWithCGImage:cgimage];
    //释放CGImage
    CGImageRelease(cgimage);
    return newImage;
}



- (UIImage *)roundImage {
    //获取size
    CGSize size = [self sizeFromImage:self];
    CGRect rect = (CGRect){CGPointZero,size};
    //新建一个图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //绘制圆形路径
    CGContextAddEllipseInRect(ctx, rect);
    //剪裁上下文
    CGContextClip(ctx);
    //绘制图片
    [self drawInRect:rect];
    //取出图片
    UIImage *roundImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return roundImage;
}
- (CGSize)sizeFromImage:(UIImage *)image{
    CGSize size = image.size;
    CGFloat wh =MIN(size.width, size.height);
    return CGSizeMake(wh, wh);
}


#pragma mark - Linear Gradient
+ (UIImage *)getLinearGradientImage:(UIColor *)startColor and:(UIColor *)endColor directionType:(WHGradientDirection)directionType
{
    return [self getLinearGradientImage:startColor and:endColor directionType:directionType option:CGSizeMake(kDefaultWidth, kDefaultHeight)];
}


+ (UIImage *)getLinearGradientImage:(UIColor *)startColor and:(UIColor *)endColor directionType:(WHGradientDirection)directionType option:(CGSize)size
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,
                             (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@(0.0f), @(1.0f)];
    
    if (directionType == WHLinearGradientDirectionLevel) {
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
    }else if (directionType == WHLinearGradientDirectionVertical){
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
    }else if (directionType == WHLinearGradientDirectionUpwardDiagonalLine){
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 1);
    }else if (directionType == WHLinearGradientDirectionDownDiagonalLine){
        gradientLayer.startPoint = CGPointMake(0, 1);
        gradientLayer.endPoint = CGPointMake(1, 0);
    }
    
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, NO, 0);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return gradientImage;
}
#pragma mark - Radial Gradient

+ (UIImage *)getRadialGradientImage:(UIColor *)centerColor and:(UIColor *)outColor
{
    return [self getRadialGradientImage:centerColor and:outColor option:CGSizeMake(kDefaultWidth, kDefaultWidth)];
}

+ (UIImage *)getRadialGradientImage:(UIColor *)centerColor and:(UIColor *)outColor option:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat raduis = MAX(size.width / 2, size.height / 2);
    CGPathAddArc(path, NULL, size.width / 2, size.height / 2, raduis, 0, 2 * M_PI, NO);
    
    [self drawRadialGradient:gc path:path startColor:centerColor.CGColor endColor:outColor.CGColor];
    CGPathRelease(path);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
+ (void)drawRadialGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    CGPoint center = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMidY(pathRect));
    CGFloat radius = MAX(pathRect.size.width / 2.0, pathRect.size.height / 2.0) * sqrt(2);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextEOClip(context);
    
    CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, 0);
    
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}




//   ChromatoAnimation
+ (void)addGradientChromatoAnimation:(UIView *)view
{
    if (view == nil) {
        return;
    }
    
    CGFloat btnHeight = view.bounds.size.height;;
    CGFloat btnWidth = view.bounds.size.width;
    
    CAGradientLayer *chromatoLayer = [CAGradientLayer layer];
    [chromatoLayer setColors:@[(__bridge id)UIColorFronHSB(0.63, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.75, 0.69, 0.88).CGColor]];
    [chromatoLayer setStartPoint:CGPointMake(0, 0)];
    [chromatoLayer setEndPoint:CGPointMake(1, 0)];
    chromatoLayer.locations = @[@(0.0f) ,@(1.0f)];
    [chromatoLayer setFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    
    CAKeyframeAnimation *chromateAnimate = [self createGradientChromatoKeyAnimation];
    
    [chromatoLayer addAnimation:chromateAnimate forKey:@"chromateAnimate"];
    
    if (chromatoLayer.superlayer == nil) {
        [view.layer insertSublayer:chromatoLayer below:view.layer.sublayers[0]];
    }
}

+ (void)addLinearGradientForLableText:(UIView *)parentView lable:(UILabel *)lable start:(UIColor *)startColor and:(UIColor *)endColor;
{
    if (parentView == nil || lable == nil) {
        return;
    }
    
    [parentView addSubview:lable];
    
    CAGradientLayer *chromatoLayer = [CAGradientLayer layer];
    [chromatoLayer setColors:@[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor]];
    [chromatoLayer setStartPoint:CGPointMake(0, 0)];
    [chromatoLayer setEndPoint:CGPointMake(1, 0)];
    chromatoLayer.locations = @[@(0.0f) ,@(1.0f)];
    [chromatoLayer setFrame:parentView.frame];
    
    [parentView.layer addSublayer:chromatoLayer];
    chromatoLayer.mask = lable.layer;
    chromatoLayer.frame = chromatoLayer.bounds;
}

+ (void)addGradientChromatoAnimationForLableText:(UIView *)parentView lable:(UILabel *)lable
{
    if (parentView == nil || lable == nil) {
        return;
    }
    
    [parentView addSubview:lable];
    
    CAGradientLayer *chromatoLayer = [CAGradientLayer layer];
    [chromatoLayer setColors:@[(__bridge id)UIColorFronHSB(0.63, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.75, 0.69, 0.88).CGColor]];
    [chromatoLayer setStartPoint:CGPointMake(0, 0)];
    [chromatoLayer setEndPoint:CGPointMake(1, 0)];
    chromatoLayer.locations = @[@(0.0f) ,@(1.0f)];
    [chromatoLayer setFrame:parentView.frame];
    
    CAKeyframeAnimation *chromateAnimate = [self createGradientChromatoKeyAnimation];
    
    [chromatoLayer addAnimation:chromateAnimate forKey:@"chromateAnimate"];
    
    [parentView.layer addSublayer:chromatoLayer];
    chromatoLayer.mask = lable.layer;
    chromatoLayer.frame = chromatoLayer.bounds;
}
#pragma mark - private method

+ (CAKeyframeAnimation *)createGradientChromatoKeyAnimation
{
    CAKeyframeAnimation *chromateAnimate = [CAKeyframeAnimation animationWithKeyPath:@"colors"];
    chromateAnimate.values = @[@[(__bridge id)UIColorFronHSB(0.63, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.75, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.73, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.85, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.83, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.95, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.88, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(1, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.98, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.1, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(1, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.12, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.1, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.22, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.2, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.32, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.3, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.42, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.4, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.52, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.5, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.62, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.6, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.72, 0.69, 0.88).CGColor],
                               @[(__bridge id)UIColorFronHSB(0.63, 0.69, 0.88).CGColor, (__bridge id)UIColorFronHSB(0.75, 0.69, 0.88).CGColor]];
    chromateAnimate.keyTimes = @[@0, @0.1, @0.2, @0.25, @0.35, @0.37, @0.47, @0.57, @0.67, @0.77, @0.87, @0.97, @1];
    chromateAnimate.duration = 6;
    chromateAnimate.removedOnCompletion = NO;
    chromateAnimate.repeatCount = MAXFLOAT;
    return chromateAnimate;
}
@end
