//
//  YLAdCountHelper.h
//  TestOCProject
//
//  Created by wl on 2019/5/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLAdCountHelper : NSObject
+ (void)setShowCount:(NSInteger)count forKey:(NSString *)key;
+ (NSInteger)showCountForKey:(NSString *)key;

+(BOOL)shouldShowNextForKey:(NSString *)key;
+ (void)decideWhetherShowNext;
@end

NS_ASSUME_NONNULL_END
