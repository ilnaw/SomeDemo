//
//  YLChain.h
//  TestOCProject
//
//  Created by wl on 2019/4/23.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLChain : NSObject


@property (nonatomic, strong, class, readonly)YLChain *man;
@property (nonatomic, strong, class, readonly)YLChain *women;

@property (nonatomic, strong, readonly)YLChain *big;
@property (nonatomic, strong, readonly)YLChain *direction;
@property (nonatomic, strong, readonly)YLChain *laker;

@property (nonatomic, readonly ,copy)NSString *(^peopleInfo)(NSString *name);
@end



NS_ASSUME_NONNULL_END
