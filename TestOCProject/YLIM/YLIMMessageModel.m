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

+ (instancetype)messageFromIMData:(YLMessageModel *)message
{
    YLIMMessageModel *model = [YLIMMessageModel new];
    model.message = message;
    model.layout = [[YLIMMessageLayoutConfig alloc]initWithMessage:message];
    return model;
}

- (NSString *)reuseId
{
    switch (self.message.messageType) {
        case YLMessageTypeText:
            return @"YLMessageTypeTextCell";
            break;
        case YLMessageTypeImage:
            return @"YLMessageTypeImageCell";
            break;
        case YLMessageTypeRedPacket:
            return @"YLMessageTypeRedPacketCell";
            break;
        case YLMessageTypeAnswer:
            return @"YLMessageTypeAnswerCell";
            break;
        default:
            return @"nullCell";
            break;
    }
}
@end
