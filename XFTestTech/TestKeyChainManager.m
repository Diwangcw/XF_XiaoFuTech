//
//  TestKeyChainManager.m
//  TestTech
//
//  Created by HelloBoy on 2018/11/7.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "TestKeyChainManager.h"
#import "TextKeyChain.h"
#import "UIDevice+TestCateghory.h"
@implementation TestKeyChainManager

static NSString *const KEY_IN_KEYCHAIN_UUID = @"KEY_UUID";

static NSString *const KEY_UUID = @"key_uuid";

//存储UUID
+(void)xf_SaveUUID:(NSString *)UUID{
    
    NSMutableDictionary *usernamePairs = [NSMutableDictionary dictionary];
    [usernamePairs setObject:UUID forKey:KEY_UUID];
    [TextKeyChain save:KEY_IN_KEYCHAIN_UUID data:usernamePairs];
}
//读取UUID
+(NSString *)xf_ReadUUID{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[TextKeyChain load:KEY_IN_KEYCHAIN_UUID];
    return [usernamepasswordKVPair objectForKey:KEY_UUID];
}

//删除
+(void)xf_DeleteUUID{
    [TextKeyChain delete:KEY_IN_KEYCHAIN_UUID];
}

+ (void)xf_getDeviceIdentifier{
    NSString *UUID = [TestKeyChainManager xf_ReadUUID];
    if (UUID == nil) {
        NSString *deviceUUID = [UIDevice getUUID];
        [TestKeyChainManager xf_SaveUUID:deviceUUID];
    }else{
        //        NSLog(@"===%@", UUID);
    }
}

@end
