//
//  YLMomentEvent.h
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YLMomentModel;
NS_ASSUME_NONNULL_BEGIN

@interface YLMomentEvent : NSObject
@property (nonatomic, strong)NSString *eventName;
@property (nonatomic, strong)YLMomentModel *model;
@end

extern NSString *const YLMomentEventNameTapShare;

NS_ASSUME_NONNULL_END
