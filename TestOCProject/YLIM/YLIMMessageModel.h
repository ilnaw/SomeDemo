//
//  YLIMMessageModel.h
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLIMMessageLayoutConfig.h"
#import "YLMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLIMMessageModel : NSObject
//消息
@property (nonatomic, strong)YLMessageModel  *message;

//layout
@property (nonatomic, readonly, strong)YLIMMessageLayoutConfig *layout;


- (instancetype)initWithMessage:(YLMessageModel *)message;

@end

NS_ASSUME_NONNULL_END
