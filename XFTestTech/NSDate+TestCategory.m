//
//  NSDate+TestCategory.m
//  TestTech
//
//  Created by HelloBoy on 2018/5/2.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "NSDate+TestCategory.h"

@implementation NSDate (TestCategory)
- (BOOL) isSameWeekWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitWeekday | NSCalendarUnitMonth | NSCalendarUnitYear | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *sourceCmps = [calendar components:unit fromDate:date];
    
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:[NSDate date] toDate:date options:0];
    NSInteger subDay = labs(dateCom.day);
    NSInteger subMonth = labs(dateCom.month);
    NSInteger subYear = labs(dateCom.year);
    
    if (subYear == 0 && subMonth == 0) { //当相关的差值等于零的时候说明在一个年、月、日的时间范围内，不是按照零点到零点的时间算的
        if (subDay > 6) { //相差天数大于6肯定不在一周内
            return NO;
        } else { //相差的天数大于或等于后面的时间所对应的weekday则不在一周内
            if (dateCom.day >= 0 && dateCom.hour >=0 && dateCom.minute >= 0) { //比较的时间大于当前时间
                //西方一周的开始是从周日开始算的，周日是1，周一是2，而我们是从周一开始算新的一周
                NSInteger chinaWeekday = sourceCmps.weekday == 1 ? 7 : sourceCmps.weekday - 1;
                if (subDay >= chinaWeekday) {
                    return NO;
                } else {
                    return YES;
                }
            } else {
                NSInteger chinaWeekday = sourceCmps.weekday == 1 ? 7 : nowCmps.weekday - 1;
                if (subDay >= chinaWeekday) { //比较的时间比当前时间小，已经过去的时间
                    return NO;
                } else {
                    return YES;
                }
            }
        }
    } else { //时间范围差值超过了一年或一个月的时间范围肯定就不在一个周内了
        return NO;
    }
}
#pragma mark - NSDate
//NSDate转时间戳
+(NSString *)xf_timeStampWithDate:(NSDate *)date{
    NSString *timeStamp = [NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]];
    return timeStamp;
}

//时间戳转换为时间方法
+(NSString *)xf_dateStringWithTimeStamp:(NSString *)timeStamp andFormatString:(NSString *)formatString{
    NSString *dateString;
    NSDate *tmpDate = [NSDate dateWithTimeIntervalSince1970:[timeStamp floatValue]];
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:formatString];
    dateString = [format stringFromDate:tmpDate];
    return dateString;
}

//格式化NSDate
+(NSString *)xf_dateStringWithDate:(NSDate *)date andFormatString:(NSString *)formatString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"dateString:%@",dateString);
    return dateString;
}


//获取当前时间并进行格式化
+(NSString *)xf_getCurrentDateWithFormatString:(NSString *)formatString{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSString *currentDateString = [self xf_dateStringWithDate:currentDate andFormatString:formatString];
    return currentDateString;
}

//将时间字符串转换成NSDate格式
+(NSDate *)xf_dateWithDateString:(NSString *)dateString andFormatString:(NSString *)formatString{
    NSDate *tmpDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    tmpDate = [dateFormatter dateFromString:dateString];
    return tmpDate;
}
@end
