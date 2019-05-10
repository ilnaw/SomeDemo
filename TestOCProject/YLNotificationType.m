//
//  YLNotificationType.m
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLNotificationType.h"

static NSArray *_rawValues;
void p_initRawValues(){
    if (_rawValues) return;
    _rawValues = @[
                   @"DEAL",
                   @"CLEAN",
                   @"IM"
                   ];
}


YLNotificationType YLNotificationTypeInit(NSString *rawValue)
{
    p_initRawValues();
    for (int i = 0; i < _rawValues.count; i++) {
        if ([_rawValues[i] isEqualToString:rawValue]) {
            return (YLNotificationType)i;
        }
    }
    return YLNotificationTypeUnknow;
}

NSString * YLNotificationTypeRawValue(YLNotificationType type)
{
    p_initRawValues();
    NSUInteger i = (NSUInteger)type;
    if (i < _rawValues.count) {
        return _rawValues[i];
    }
    return nil;
}

NSString *const YLNotificationRefreshList = @"refreshList";
NSNotificationName const YLNotificationNameRefreshDetail = @"refreshDetail";
