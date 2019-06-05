//
//  YLIMMessageBaseCell.m
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageCell.h"
#import "YLIMMessageBubbleView.h"

@implementation YLIMMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configBaseUI];
    }
    return self;
}

- (void)configBaseUI{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //各个view的frame设置
}

- (void)setModel:(YLIMMessageModel *)model
{
    _model = model;
    [self configData];
}

- (void)configData{
    [self _addBubbleView];
    
    self.nameLabel.text = @"万里";
    self.avator.image = [UIImage imageNamed:@"jiankys14_icon"];
}

- (void)_addBubbleView{
    if (self.bubbleView == nil) {
        self.bubbleView = [YLIMMessageBubbleView new];
        [self.bubbleView refreshData:self.model];
    }
}

@end
