//
//  NSArray+Blocks.h
//  ClientCubeOC
//
//  Created by 初唐科技 on 2018/3/27.
//  Copyright © 2018年 pretang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Blocks)

- (void)each:(void (^)(id object, NSUInteger index))block;
- (NSArray *)map:(id (^)(id object))block;
- (NSArray *)filter:(BOOL (^)(id object))block;
- (NSArray *)reject:(BOOL (^)(id object))block;
- (id)detect:(BOOL (^)(id object))block;
- (id)reduce:(id (^)(id accumulator, id object))block;
- (id)reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;

@end
