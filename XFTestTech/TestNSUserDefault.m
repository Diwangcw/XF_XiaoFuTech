//
//  TestNSUserDefault.m
//  TestTech
//
//  Created by HelloBoy on 2018/4/2.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "TestNSUserDefault.h"

@implementation TestNSUserDefault
+ (void)PutDefaults:(NSString *)key Value:(id)value {
    if (key!=NULL&&value!=NULL)
    {
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        [userDefaults setObject:value forKey:key];
        [userDefaults synchronize];
    }
}
+(id)GetDefaults:(NSString *)key {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    id obj;
    if (key!=NULL) {
        obj=[userDefaults objectForKey:key];
    }
    return obj;
}
@end
