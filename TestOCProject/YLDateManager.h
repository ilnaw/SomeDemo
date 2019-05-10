//
//  YLDateManager.h
//  TestOCProject
//
//  Created by zfh on 2019/4/11.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLDateManager : NSObject
+ (instancetype)shared;

- (void)beginTrack;
- (void)endTrack;
@end

NS_ASSUME_NONNULL_END
