//
//  NSDate+GBExt.m
//  Pods
//
//  Created by chenguibang on 2017/8/12.
//
//

#import "NSDate+GBExt.h"

@implementation NSDate(GBExt)

- (NSTimeInterval)gb_timestamp13{
    return [self timeIntervalSince1970]*1000.0;
}

+ (NSString *)gb_timeStringOf:(NSString *)timestamp format:(NSString *)format{
    if (format==nil) {
        format = @"yyyy-MM-dd";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:format];
    return [objDateformat stringFromDate: date];
}

@end
