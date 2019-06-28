//
//  YLAdCountHelper.m
//  TestOCProject
//
//  Created by wl on 2019/5/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLAdCountHelper.h"

static NSString *const kMonthMaps = @"MonthMaps";

@implementation YLAdCountHelper
+ (void)setShowCount:(NSInteger)count forKey:(NSString *)key
{
    NSMutableDictionary *maps = [[[NSUserDefaults standardUserDefaults]objectForKey:kMonthMaps] mutableCopy];
    if (!maps) {
        maps = [NSMutableDictionary new];
    }
    [maps setObject:@(count) forKey:key];
    [[NSUserDefaults standardUserDefaults]setObject:maps forKey:kMonthMaps];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSInteger)showCountForKey:(NSString *)key
{
    NSMutableDictionary *maps = [[NSUserDefaults standardUserDefaults]objectForKey:kMonthMaps];
    return [maps[key] integerValue];
}

+ (void)decideWhetherShowNext
{
    NSMutableDictionary *maps = [[NSUserDefaults standardUserDefaults]objectForKey:kMonthMaps];
    if (maps) {
        NSArray *keys = maps.allKeys;
        for (NSString *key in keys) {
            NSNumber *count = maps[key];
            if (count.integerValue >= 2) {
                [self setShouldShowNext:YES key:key];
            }
        }
    }
}

static NSMutableDictionary *ShowNextMaps = nil;
+ (BOOL)shouldShowNextForKey:(NSString *)key
{
    BOOL showNext = [ShowNextMaps[key] boolValue];
    if (showNext) {
        [self setShowCount:0 forKey:key];
    }
    ShowNextMaps[key] = @(NO);
    return showNext;
}

+ (void)setShouldShowNext:(BOOL)should key:(NSString *)key
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ShowNextMaps = [NSMutableDictionary new];
    });
    ShowNextMaps[key] = @(should);
}
@end
