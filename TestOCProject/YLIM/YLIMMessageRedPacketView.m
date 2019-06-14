//
//  YLIMMessageRedPacketView.m
//  TestOCProject
//
//  Created by wl on 2019/6/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageRedPacketView.h"
#import "YLIMMessageModel.h"

@interface YLIMMessageRedPacketView()
@property (nonatomic, strong)UIImageView *redPacket;
@end

@implementation YLIMMessageRedPacketView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    [super configUI];
    UIImageView *imageView = [UIImageView new];
    imageView.layer.masksToBounds = YES;

    [self addSubview:imageView];
    self.redPacket = imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.redPacket.left = self.model.layout.bubbleViewInsets.left;
    self.redPacket.top = self.model.layout.bubbleViewInsets.top;
    self.redPacket.yl_size = self.model.layout.contentSize;
}

- (void)refreshData:(YLIMMessageModel *)model
{
    self.model = model;
    if (model.layout.showLeft) {
        self.redPacket.image = [[UIImage imageNamed:@"border"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30)
                                                                           resizingMode:UIImageResizingModeStretch];;
    } else {
        self.redPacket.image = [[UIImage imageNamed:@"hbr"] resizableImageWithCapInsets:UIEdgeInsetsMake(25, 5, 5, 8)
                                                                         resizingMode:UIImageResizingModeStretch];
    }
}

- (void)bubbleTouchUpInside:(id)sender{
    if ([self.delegate respondsToSelector:@selector(catchEvent:)]) {
        YLIMEvent *event = [YLIMEvent new];
        event.model = self.model.message;
        event.eventName = YLIMEventNameTapContent;
        [self.delegate catchEvent:event];
    }
}

@end
