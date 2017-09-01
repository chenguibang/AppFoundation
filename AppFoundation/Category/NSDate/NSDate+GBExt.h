//
//  NSDate+GBExt.h
//  Pods
//
//  Created by chenguibang on 2017/8/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDate(GBExt)

- (NSTimeInterval)gb_timestamp13;

+ (NSString *)gb_timeStringOf:(NSString *)timestamp format:(NSString *)format;

@end
