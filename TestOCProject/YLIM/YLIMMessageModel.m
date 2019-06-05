//
//  YLIMMessageModel.m
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageModel.h"

@interface YLIMMessageModel()
@property (nonatomic ,strong)YLIMMessageLayoutConfig *layout;
@end

@implementation YLIMMessageModel
- (instancetype)initWithMessage:(YLMessageModel *)message
{
    if (self = [super init]) {
        self.message = message;
        self.layout = [[YLIMMessageLayoutConfig alloc]initWithMessage:message];
    }
    return self;
}
@end
