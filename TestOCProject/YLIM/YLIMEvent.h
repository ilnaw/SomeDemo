//
//  YLIMEvent.h
//  TestOCProject
//
//  Created by wl on 2019/6/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YLMessageModel;

NS_ASSUME_NONNULL_BEGIN

@interface YLIMEvent : NSObject
@property (nonatomic, strong)NSString *eventName;
@property (nonatomic, strong)YLMessageModel *model;
@end


extern NSString *const YLIMEventNameTapContent;

NS_ASSUME_NONNULL_END
