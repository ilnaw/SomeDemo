//
//  YLDateManager.m
//  TestOCProject
//
//  Created by zfh on 2019/4/11.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLDateManager.h"

@interface YLDateManager()
@property (nonatomic,strong)dispatch_queue_t   queue;
@end

@implementation YLDateManager
+ (instancetype)shared
{
    static YLDateManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YLDateManager alloc]init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = dispatch_queue_create([[self.class description] UTF8String], NULL);
    }
    return self;
}

- (void)beginTrack{

}
- (void)endTrack{
    
}
@end
