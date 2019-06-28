//
//  YLIMManager.h
//  TestOCProject
//
//  Created by wl on 2019/6/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLIMManager : NSObject

+ (instancetype)shared;



/**
 能否发送文字

 规则 连续3条消息在2s内发送 最后一条不能发送
 
 @return BOOL
 */
- (BOOL)canSendText;
/**
 能否发送图片
 
 规则 连续2张图片在5s内发送 最后一条不能发送
 
 @return BOOL
 */
- (BOOL)canSendImage;



@end

NS_ASSUME_NONNULL_END
