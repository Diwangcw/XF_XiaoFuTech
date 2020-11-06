//
//  TestQuickHelper.h
//  TestTech
//
//  Created by HelloBoy on 2018/4/3.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestQuickHelper : NSObject

///把一个Block放入主线程
+ (void)GCDPutOneBlockIntoMainThreadIsNew:(BOOL)isNew DelayTime:(double)delayTime Block:(void(^)(void))block;

///把一个Block放入子线程
+ (void)GCDPutOneBlockIntoGlobalThreadIsNew:(BOOL)isNew DelayTime:(double)delayTime Block:(void(^)(void))block;
@end
