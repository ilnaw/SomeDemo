//
//  NSDateFormatter+Convenience.m
//  TestOCProject
//
//  Created by wl on 2019/5/30.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "NSDateFormatter+Convenience.h"

@implementation NSDateFormatter (Convenience)

+ (instancetype)dateFormatterWithFormat:(NSString *)format{
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_semaphore_t semaphore = NULL;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc]init];
        semaphore = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dateFormatter.dateFormat = format;
    dispatch_semaphore_signal(semaphore);
    
    return dateFormatter;
}
@end
