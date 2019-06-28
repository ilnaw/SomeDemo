//
//  NSMutableArray+Queue_Stack.h
//  TestOCProject
//
//  Created by wl on 2019/5/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Queue_Stack)

//queue first in first out
- (void)enQueue:(id)obj;
- (id)deQueue;

//stack first in last out
- (void)enStack:(id)obj;
- (id)deStack;

@end

NS_ASSUME_NONNULL_END
