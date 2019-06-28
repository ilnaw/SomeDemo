//
//  NSDictionary+Blocks.h
//  ClientCubeOC
//
//  Created by 初唐科技 on 2018/3/27.
//  Copyright © 2018年 pretang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Blocks)
- (void)each:(void (^)(id key, id value))block;
- (void)eachKey:(void (^)(id key))block;
- (void)eachValue:(void (^)(id value))block;
- (NSArray *)map:(id (^)(id key, id value))block;
- (NSDictionary *)pick:(NSArray *)keys;
- (NSDictionary *)omit:(NSArray *)keys;
@end
