//
//  APNSManager.h
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLNotificationType.h"

NS_ASSUME_NONNULL_BEGIN
@interface APNSManager : NSObject
+ (instancetype)shared;


/**
 获取未读消息
 */
- (void)fetchUnreadMessage;

/**
 处理未读消息
 */
- (void)handleUnreadMessage;

/**
 处理消息的x跳转

 @param detailID 详情ID
 @param type 类型
 @param dic 额外信息
 */
- (void)handleJumpWithDetailID:(NSNumber *)detailID
                          type:(YLNotificationType )type
                      userInfo:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
