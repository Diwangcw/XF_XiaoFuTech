//
//  NSObject+BlockSEL.h
//
//
//  Created by HJaycee on 2017/4/28.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @param weakSelf 方便使用，用来打破循环引用。使用时需要改成实际类型，否则没有代码提示.
 @param arg 事件默认传递的对象，比如`NSNotification`，`UIButton`。
 */
typedef void (^callback)(id weakSelf, id arg);

@interface NSObject (BlockSEL)

/**
  调用
 // button
 
 [self.btn addTarget:self action:[self selectorBlock:^(ViewController *weakSelf, id arg) {
 NSLog(@"clicked %@", arg);
 //        weakSelf.view.backgroundColor = [UIColor lightGrayColor];
 }] forControlEvents:UIControlEventTouchUpInside];
 
 // gesture
 UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:[self selectorBlock:^(id weakSelf, id arg) {
 NSLog(@"tap %@", arg);
 }]];
 [self.label addGestureRecognizer:tap];
 
 // timer
 NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:[self selectorBlock:^(id weakSelf, id arg) {
 NSLog(@"timer run %@", arg);
 }] userInfo:nil repeats:NO];
 [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
 
 // notification
 [[NSNotificationCenter defaultCenter] addObserver:self selector:[self selectorBlock:^(id weakSelf, id arg) {
 NSLog(@"resign active %@", arg);
 }] name:UIApplicationWillResignActiveNotification object:nil];
 **/




/**
 用block来代替selector
 */
- (SEL)selectorBlock:(callback)block;

@end
