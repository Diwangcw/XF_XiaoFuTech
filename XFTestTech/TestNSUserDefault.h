//
//  TestNSUserDefault.h
//  TestTech
//
//  Created by HelloBoy on 2018/4/2.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestNSUserDefault : NSObject

+(void)PutDefaults:(NSString *)key Value:(id)value;
+(id)GetDefaults:(NSString *)key;

@end
