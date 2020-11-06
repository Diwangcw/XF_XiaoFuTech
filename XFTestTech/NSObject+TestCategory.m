//
//  NSObject+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/2/27.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "NSObject+TestCategory.h"
#import <objc/runtime.h>
@implementation NSObject (TestCategory)
+ (BOOL)dx_isNullOrNilWithObject:(id)object {
    if (object == nil || [object isEqual:[NSNull null]]) {
        return YES;
    } else if ([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@""]) {
            return YES;
        } else {
            return NO;
        }
    } else if ([object isKindOfClass:[NSNumber class]]) {
        if ([object isEqualToNumber:@0]) {
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}
/**
 *  对象转换为字典
 *
 *  @param obj 需要转化的对象
 *
 *  @return 转换后的字典
 */
+ (NSDictionary*)getObjectData:(id)obj {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);//获得属性列表
    for(int i = 0;i < propsCount; i++) {
        
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        if(value == nil) {
            
            value = [NSNull null];
        } else {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    
    return dic;
}


+ (id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}

- (id)xf_checkNull
{
    if ([self isKindOfClass:[NSDictionary class]]
        || [self isKindOfClass:[NSMutableDictionary class]])
    {
        NSMutableDictionary *dict = [NSMutableDictionary
                                     dictionaryWithDictionary:(NSDictionary *)self];
        for (int i = 0; i < dict.allKeys.count; i++) {
            NSString *key = [dict.allKeys objectAtIndex:i];
            id obj = [dict objectForKey:key];
            if ([obj isKindOfClass:[NSArray class]]
                || [obj isKindOfClass:[NSMutableArray class]]
                || [obj isKindOfClass:[NSDictionary class]]
                || [obj isKindOfClass:[NSMutableDictionary class]]) {
                obj = [obj xf_checkNull];
                [dict setObject:obj forKey:key];
            } else if (![obj xf_NotNull]) {
                obj = @"";
                [dict setObject:obj forKey:key];
            }
        }
        if ([self isKindOfClass:[NSDictionary class]]) {
            return [dict copy];
        } else {
            return dict;
        }
    } else if ([self isKindOfClass:[NSArray class]]
               || [self isKindOfClass:[NSMutableArray class]]) {
    }
    return self;
}



#pragma mark judge
- (BOOL)xf_NotNull {
    if (self == nil) {
        return NO;
    }else if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }else if ([self isKindOfClass:[NSString class]] ||
             [self isKindOfClass:[NSData class]]) {
        if (((NSString *)self).length == 0) {
            return NO;
        }
    }
    return YES;
}


#pragma mark change
+ (NSString *)GetJsonStringFromObject:(id)object {
    if (!object) {
        return nil;
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[object copy]
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}

+ (id)xf_ConvertToObject:(NSString *)jsonString {
    if (![jsonString xf_NotNull]) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves
                                                  error:nil];
    return object;
}


- (NSString *)xf_convertToJsonString{
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[self copy]
                                    options:NSJSONWritingPrettyPrinted
                                      error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}


#pragma mark >> 字典对象互转 <<
/**
 将对象转成字典
 @return 字典
 */
+ (NSDictionary*)xf_ObjectToDictionary{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([self class], &propsCount);//获得属性列表
    for(int i = 0;i < propsCount; i++) {
        
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [self valueForKey:propName];
        if(value == nil) {
            
            value = [NSNull null];
        } else {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    
    return dic;
    
}

@end
