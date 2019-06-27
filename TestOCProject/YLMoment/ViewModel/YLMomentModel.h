//
//  YLMomentModel.h
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLMomentLayout.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YLMomentContentType) {
    YLMomentContentTypePhotos,
    YLMomentContentTypeShares,
    YLMomentContentTypeVideos,
};

@interface YLMomentModel : NSObject
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *avator;
@property (nonatomic, strong)NSString *content;
@property (nonatomic, strong)NSString *time;
@property (nonatomic, strong)NSArray *comments;
@property (nonatomic, strong)NSArray *photos;
@property (nonatomic, strong)YLMomentLayout *layout;
@property (nonatomic, assign)YLMomentContentType type;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
