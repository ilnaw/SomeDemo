//
//  YLIMMessageBubbleView.m
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageBubbleView.h"
#import "YLIMMessageTextView.h"
#import "YLIMMessageImageView.h"
#import "YLIMMessageAnswerView.h"
#import "YLIMMessageRedPacketView.h"
#import "YLIMMessageModel.h"

@implementation YLIMMessageBubbleView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

+ (instancetype)bubbleViewWithMessage:(YLIMMessageModel *)message
{
    YLIMMessageBubbleView *view = nil;
    if (message.message.messageType == YLMessageTypeText) {
        view = [[YLIMMessageTextView alloc]init];
    }else if (message.message.messageType == YLMessageTypeImage){
        view = [[YLIMMessageImageView alloc]init];
    }else if (message.message.messageType == YLMessageTypeAnswer){
        view = [[YLIMMessageAnswerView alloc]init];
    }else if (message.message.messageType == YLMessageTypeRedPacket){
        view = [[YLIMMessageRedPacketView alloc]init];
    }
    return view;
}

//for subclass
- (void)configUI
{
    [self addTarget:self
             action:@selector(bubbleTouchUpInside:)
   forControlEvents:UIControlEventTouchUpInside];
    
    self.backgroundColor = [UIColor blackColor];
    self.layer.cornerRadius = 4;
}

- (void)bubbleTouchUpInside:(id)sender{

}

- (void)refreshData:(YLIMMessageModel *)model
{
    
}
@end
