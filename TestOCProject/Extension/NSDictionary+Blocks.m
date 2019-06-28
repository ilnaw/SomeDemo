
//
//  NSDictionary+Blocks.m
//  ClientCubeOC
//
//  Created by 初唐科技 on 2018/3/27.
//  Copyright © 2018年 pretang. All rights reserved.
//

#import "NSDictionary+Blocks.h"

@implementation NSDictionary (Blocks)

- (void)each:(void (^)(id key, id value))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (void)eachKey:(void (^)(id key))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key);
    }];
}

- (void)eachValue:(void (^)(id value))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(obj);
    }];
}

- (NSArray *)map:(id (^)(id key, id value))block
{
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id object = block(key, obj);
        if (object) {
            [array addObject:object];
        }
    }];
    return array;
}

- (NSDictionary *)pick:(NSArray *)keys
{
    NSMutableDictionary *picked = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([keys containsObject:key]) {
            picked[key] = obj;
        }
    }];
    return picked;
}

- (NSDictionary *)omit:(NSArray *)keys
{
    NSMutableDictionary *omitted = [[NSMutableDictionary alloc] initWithCapacity:(self.allKeys.count - keys.count)];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![keys containsObject:key]) {
            omitted[key] = obj;
        }
    }];
    return omitted;
}

@end
