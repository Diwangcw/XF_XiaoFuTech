//
//  TestKeyChainManager.h
//  TestTech
//
//  Created by HelloBoy on 2018/11/7.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestKeyChainManager : NSObject

//存储UUID
+(void)xf_SaveUUID:(NSString *)UUID;

//读取UUID
+(NSString *)xf_ReadUUID;

//删除
+(void)xf_DeleteUUID;



/*
 *需要现在appDelegate 调用该方法
 *判断key
 */
+ (void)xf_getDeviceIdentifier;

@end

NS_ASSUME_NONNULL_END
