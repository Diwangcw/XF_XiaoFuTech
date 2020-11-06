//
//  TestBaseViewController.h
//  XFTestTech
//
//  Created by HelloBoy on 2019/2/20.
//  Copyright © 2019 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestBaseViewController : UIViewController <UIGestureRecognizerDelegate>



@property (nonatomic, assign) BOOL statusBarHide;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL disableSlide;
@property (nonatomic, assign) BOOL navigationBarHide;
@property (nonatomic, assign) BOOL bottomLineHide;

@property (nonatomic, strong) UIButton *rightBtn_base;

- (UIButton *)setupRightFinishedBtnTitle:(NSString *)title Action:(SEL)action;
-(void)keyboardToHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
