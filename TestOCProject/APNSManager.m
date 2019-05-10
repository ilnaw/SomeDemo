//
//  APNSManager.m
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "APNSManager.h"

@implementation APNSManager

 + (instancetype)shared
{
    static APNSManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[APNSManager alloc]init];
    });
    return instance;
}


- (void)fetchUnreadMessage
{
    
}

- (void)handleUnreadMessage
{
    
}

- (void)handleJumpWithDetailID:(NSNumber *)detailID type:(YLNotificationType)type userInfo:(NSDictionary *)dic
{
    switch (type) {
        case YLNotificationTypeIM:
            NSLog(@"---------收到IM消息");
            break;
        default:
            NSLog(@"----------无法处理的消息");
            break;
    }
}
@end
