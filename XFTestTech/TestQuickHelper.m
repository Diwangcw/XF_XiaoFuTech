//
//  TestQuickHelper.m
//  TestTech
//
//  Created by HelloBoy on 2018/4/3.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "TestQuickHelper.h"

@implementation TestQuickHelper

///把一个Block放入主线程
+ (void)GCDPutOneBlockIntoMainThreadIsNew:(BOOL)isNew DelayTime:(double)delayTime Block:(void(^)(void))block{
//    if (isNew) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
//    }
    
    if (block) {
        if (delayTime>0) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [NSThread sleepForTimeInterval:delayTime];
                dispatch_async(dispatch_get_main_queue(), ^{
                    block();
                });
            });
        }
        else {
            if ([NSThread isMainThread] && !isNew) {
                block();
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    block();
                });
            }
        }
    }
    
}

///把一个Block放入子线程
+ (void)GCDPutOneBlockIntoGlobalThreadIsNew:(BOOL)isNew DelayTime:(double)delayTime Block:(void(^)(void))block{
//    if (isNew) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
//    }
    
    if (block) {
        if (![NSThread isMainThread] && !isNew) {
            if (delayTime) {
                [NSThread sleepForTimeInterval:delayTime];
            }
            block();
        }
        else {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                if (delayTime) {
                    [NSThread sleepForTimeInterval:delayTime];
                }
                block();
            });
        }
    }
}

@end
