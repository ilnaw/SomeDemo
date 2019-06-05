//
//  YLMessageModel.m
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMessageModel.h"

@implementation YLMessageModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.left = [dic[@"left"] isEqualToString:@"1"];
        self.group = [dic[@"group"] isEqualToString:@"1"];
        self.content = dic[@"content"];
        self.url = dic[@"url"];
        self.messageType = [dic[@"type"] integerValue];
    }
    return self;
}
@end
