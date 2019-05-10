//
//  YLNotificationType.h
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YLNotificationType) {
    YLNotificationTypeDeal = 0,
    YLNotificationTypeClean,
    YLNotificationTypeIM,
    YLNotificationTypeUnknow = 9999
};

extern YLNotificationType YLNotificationTypeInit(NSString *rawValue);
extern NSString * YLNotificationTypeRawValue(YLNotificationType type);

extern NSString *const YLNotificationRefreshList;
extern NSNotificationName const YLNotificationNameRefreshDetail;
