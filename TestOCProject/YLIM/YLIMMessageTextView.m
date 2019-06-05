//
//  YLIMMessageTextView.m
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageTextView.h"
#import "YLIMMessageModel.h"

@interface YLIMMessageTextView()

@end

@implementation YLIMMessageTextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}
- (void)configUI{
    [super configUI];
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:14.f];
    label.textAlignment = NSTextAlignmentJustified;
    label.textColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    [self addSubview:label];
    self.contentLabel = label;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    YLIMMessageLayoutConfig *layout = self.model.layout;
    CGFloat top = layout.bubbleViewInsets.top;
    CGFloat left = layout.bubbleViewInsets.left;
    CGSize size = layout.contentSize;
    
    self.contentLabel.top = top;
    self.contentLabel.left = left;
    self.contentLabel.yl_size = size;
}
- (void)refreshData:(YLIMMessageModel *)model
{
    self.model = model;
    self.contentLabel.text = self.model.message.content;
}

@end
