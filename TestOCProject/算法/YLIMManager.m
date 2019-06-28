//
//  YLIMManager.m
//  TestOCProject
//
//  Created by wl on 2019/6/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMManager.h"

@interface YLIMManager()
@property (nonatomic, strong)NSMutableArray *textMessageQueue;
@property (nonatomic, strong)NSMutableArray *imageMessageQueue;
@property (nonatomic, assign)NSTimeInterval textLimitTime;
@property (nonatomic, assign)NSTimeInterval imageLimitTime;

//第二种记录方式 上一次发送时间
@property (nonatomic, assign)NSTimeInterval lastSendImageTime;
@end

@implementation YLIMManager
+ (instancetype)shared{
    static YLIMManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = YLIMManager.new;
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.textMessageQueue = @[].mutableCopy;
        self.imageMessageQueue = @[].mutableCopy;
    }
    return self;
}

- (BOOL)canSendText
{
    NSTimeInterval now = NSDate.date.timeIntervalSince1970;
    if (self.textLimitTime > 0) {
        if (now - self.textLimitTime < 3) {
            return false;
        }else{
            self.textLimitTime = 0;
        }
    }
    //message创建时间
    if (!self.textMessageQueue.count) {
        [self.textMessageQueue addObject:@(now)];
        return true;
    }
    
    //连续3次间隔小于2，最后一条不发送
    NSTimeInterval before = [self.textMessageQueue.lastObject doubleValue];
    //小于2s 进入队列
    if (now - before < 2) {
        [self.textMessageQueue addObject:@(now)];
    }else{
        [self.textMessageQueue removeAllObjects];
        [self.textMessageQueue addObject:@(now)];
    }
    
    if (self.textMessageQueue.count > 2) {
        self.textLimitTime = now;
        [self.textMessageQueue removeAllObjects];
        return false;
    }
    
    return true;
}

- (BOOL)canSendImage
{
    NSTimeInterval now = NSDate.date.timeIntervalSince1970;
    if (self.lastSendImageTime > 0) {
        if (now - self.lastSendImageTime < 5) {
            return false;
        }
    }
    self.lastSendImageTime = now;
    return true;
}

- (BOOL)canSendImageBySendSpacing:(NSInteger )spacing
                     timeInterval:(NSTimeInterval )timeInterval
                        limitTime:(NSTimeInterval )limitTime
{
    NSTimeInterval now = NSDate.date.timeIntervalSince1970;
    if (self.imageLimitTime > 0) {
        if (now - self.imageLimitTime < limitTime) {
            return false;
        }else{
            self.imageLimitTime = 0;
        }
    }
    //message创建时间
    if (!self.imageMessageQueue.count) {
        [self.imageMessageQueue addObject:@(now)];
        return true;
    }
    
    //连续3次间隔小于2，最后一条不发送
    NSTimeInterval before = [self.textMessageQueue.lastObject doubleValue];
    //小于2s 进入队列
    if (now - before < timeInterval) {
        [self.imageMessageQueue addObject:@(now)];
    }else{
        [self.imageMessageQueue removeAllObjects];
        [self.imageMessageQueue addObject:@(now)];
    }
    
    if (self.imageMessageQueue.count > (spacing - 1)) {
        self.imageLimitTime = now;
        [self.imageMessageQueue removeAllObjects];
        return false;
    }
    
    return true;
}

@end
