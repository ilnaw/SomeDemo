//
//  YLMomentModel.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentModel.h"

@implementation YLMomentModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.name = dic[@"name"];
        self.time = dic[@"time"];
        self.comments = [dic[@"comments"] copy];
        self.content = dic[@"content"];
        self.avator = dic[@"avator"];
        self.photos = [dic[@"photos"] copy];
        self.type = [dic[@"type"] integerValue];
        
        self.layout = [YLMomentLayout layoutWithModel:self];
    }
    return self;
}
@end
