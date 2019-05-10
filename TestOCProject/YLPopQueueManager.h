//
//  YLPopQueueManager.h
//  TestOCProject
//
//  Created by wl on 2019/5/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YLPopTaskPriority) {
    YLPopTaskPriorityLow = 50,
    YLPopTaskPriorityDefault = 100,
    YLPopTaskPriorityHigh = 500,
};

typedef NS_ENUM(NSUInteger, YLPopTaskQueueStatus) {
    YLPopTaskQueueStatusIdle,
    YLPopTaskQueueStatusNormal,
    YLPopTaskQueueStatusBusy,
};

NS_ASSUME_NONNULL_BEGIN

@interface YLPopQueueManager : NSObject
+ (instancetype)shared;

//加入任务
- (void)addTask:(dispatch_block_t)task;
- (void)addTask:(dispatch_block_t)task priority:(YLPopTaskPriority)priority;

////开始队列任务
//- (void)startTaskQueue;
//重置队列状态
- (void)resetTaskQueueStatus:(YLPopTaskQueueStatus)status;


@end

NS_ASSUME_NONNULL_END
