//
//  NSObject+TestCategory.h
//  TestTech
//
//  Created by HelloBoy on 2018/2/27.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (TestCategory)
//判断对象是否为空，yes为空
+ (BOOL)dx_isNullOrNilWithObject:(id)object;
//对象转化为字典
+ (NSDictionary*)getObjectData:(id)obj;

/**
 检查 字典、数组 中是否存在NSNull类型，并且自动将NSNull类型转成空串
 @return 处理完成的新的对象
 */
- (id)xf_checkNull;

/**
 判断对象是否为空
 @return 判断结果
 */
- (BOOL)xf_NotNull;



#pragma mark >> json解析、转换 <<
/*
 * 对象字符串相互转换
 */
+ (NSString *)GetJsonStringFromObject:(id)object;

/**
 将对象转成json字符串
 @return json字符串
 */
- (NSString *)xf_convertToJsonString;
/**
 将json字符串转成对象
 @param jsonString json字符串
 @return 对象实例
 */
+ (id)xf_ConvertToObject:(NSString *)jsonString;



#pragma mark >> 字典对象互转 <<
/**
 将对象转成字典
 @return 字典
 */

+ (NSDictionary*)xf_ObjectToDictionary;








@end
