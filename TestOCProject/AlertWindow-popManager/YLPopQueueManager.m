//
//  YLPopQueueManager.m
//  TestOCProject
//
//  Created by wl on 2019/5/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLPopQueueManager.h"

@interface YLPopTask : NSObject
- (instancetype)initWithTask:(dispatch_block_t)task priority:(YLPopTaskPriority)priority;

@property (nonatomic, copy)dispatch_block_t task;
@property (nonatomic, assign)YLPopTaskPriority priority;

@end

@implementation YLPopTask

- (instancetype)initWithTask:(dispatch_block_t)task priority:(YLPopTaskPriority)priority
{
    self = [super init];
    if(self){
        self.priority = priority;
        self.task = [task copy];
    }
    return self;
}

@end

@interface YLPopQueueManager()

//0 空闲 1占有 2繁忙
@property (nonatomic, assign)YLPopTaskQueueStatus popTaskQueueStatus;
@property (nonatomic, strong)NSMutableArray<YLPopTask *>  *popTaskQueue;
//总开关
@property (nonatomic, assign)BOOL popTaskQueueActive;
//同步信号
@property (nonatomic, strong)dispatch_semaphore_t syncSemaphore;
@end

@implementation YLPopQueueManager
+ (instancetype)shared
{
    static YLPopQueueManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YLPopQueueManager alloc]init];
        instance.popTaskQueue = [NSMutableArray new];
        instance.popTaskQueueStatus = YLPopTaskQueueStatusIdle;
        instance.syncSemaphore = dispatch_semaphore_create(1);
        instance.popTaskQueueActive = true;
    });
    
    return instance;
}

- (void)addTask:(dispatch_block_t)task
{
    [self addTask:task priority:YLPopTaskPriorityDefault];
}

- (void)addTask:(dispatch_block_t)task priority:(YLPopTaskPriority)priority
{
    dispatch_semaphore_wait(self.syncSemaphore, DISPATCH_TIME_FOREVER);
    //creat pop task and insert to queue
    if (task) {
        YLPopTask *popTask = [[YLPopTask alloc]initWithTask:task priority:priority];
        [self _insertPopTask:popTask];
    }

    //执行
    [self _popTaskExecute];
    
    dispatch_semaphore_signal(self.syncSemaphore);
}

- (void)resetTaskQueueStatus:(YLPopTaskQueueStatus)status
{
    dispatch_semaphore_wait(self.syncSemaphore, DISPATCH_TIME_FOREVER);
    
    if (status >= YLPopTaskQueueStatusBusy) {
        return;
    }
    
    self.popTaskQueueStatus = status;
    
    //执行下一个task
    [self _popTaskExecute];
    
    dispatch_semaphore_signal(self.syncSemaphore);
}

- (void)startTaskQueue
{
    [self _popTaskExecute];
}

- (void)_popTaskExecute
{
    //busy return
    if (self.popTaskQueueStatus >= YLPopTaskQueueStatusNormal) {
        return;
    }
    
    YLPopTask *task = self.popTaskQueue.firstObject;
    if (task && [self _timeToPop]) {
        task.task();
        self.popTaskQueueStatus = YLPopTaskQueueStatusBusy;
        [self.popTaskQueue removeObject:task];
    }
}

- (void)_insertPopTask:(YLPopTask *)task
{
    if (task == nil || task.task == nil) {
        return;
    }
    
    //从最后根据优先级插入队列插入
    NSInteger taskIndex = self.popTaskQueue.count - 1;
    for (; taskIndex >= 0; taskIndex --) {
        YLPopTask *tempTask = self.popTaskQueue[taskIndex];
        if (tempTask.priority >= task.priority) {
            break;
        }
    }
    
    taskIndex += 1;
    if (taskIndex >= 0 && taskIndex <= self.popTaskQueue.count) {
        [self.popTaskQueue insertObject:task atIndex:taskIndex];
    }
}

//开关 以及 判断一些状态
- (BOOL)_timeToPop
{
    if (!self.popTaskQueueActive)
    {
        return false;
    }
    //eg guide is presenting
    BOOL isShowGuide = false;
    if (isShowGuide) {
        return false;
    }
    
    //eg rootVC is nil
    BOOL rootVCIsNil = false;
    if (rootVCIsNil) {
        return false;
    }
    
    return true;
}
@end
