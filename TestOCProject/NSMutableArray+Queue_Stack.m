//
//  NSMutableArray+Queue_Stack.m
//  TestOCProject
//
//  Created by wl on 2019/5/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "NSMutableArray+Queue_Stack.h"

@implementation NSMutableArray (Queue_Stack)
- (void)enQueue:(id)obj
{
    if (!obj) {
        return;
    }
    [self addObject:obj];
}

- (id)deQueue
{
    if (!self.count) {
        return nil;
    }
    id first = [self objectAtIndex:0];
    if (first) {
        [self removeObject:first];
    }
    return first;
}

- (void)enStack:(id)obj
{
    if (!obj) {
        return;
    }
    [self addObject:obj];
}

- (id)deStack
{
    if (!self.count) {
        return nil;
    }
    id last = [self objectAtIndex:self.count - 1];
    if (last) {
        [self removeObject:last];
    }
    return last;
}
@end
