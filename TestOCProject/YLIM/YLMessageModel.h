//
//  YLMessageModel.h
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//
typedef NS_ENUM(NSUInteger, YLMessageType) {
    YLMessageTypeText,
    YLMessageTypeImage,
    YLMessageTypeRedPacket,
    YLMessageTypeAnswer
};

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface YLMessageModel : NSObject
@property (nonatomic, assign)BOOL left;
@property (nonatomic, assign)BOOL group;
@property (nonatomic, assign)YLMessageType messageType;
@property (nonatomic, strong)NSString *content;
@property (nonatomic, strong)NSString *url;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
