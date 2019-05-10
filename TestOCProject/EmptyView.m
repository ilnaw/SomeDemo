//
//  EmptyView.m
//  TestOCProject
//
//  Created by wl on 2019/5/7.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "EmptyView.h"
#import <Masonry/Masonry.h>

@interface EmptyView()
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *messageLabel;
@property (nonatomic, strong)UIButton *button;
@end

@implementation EmptyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI{
    UIImageView *icon = UIImageView.new;
    icon.image = [UIImage imageNamed:@"remind_add_img"];
    [self addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.greaterThanOrEqualTo(self);
        make.right.lessThanOrEqualTo(self);
        make.centerX.equalTo(self);
    }];
    _icon = icon;
    
    UILabel *label = UILabel.new;
    label.text = @"关注更新消息，清点";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(icon.mas_bottom).offset(4);
        make.centerX.equalTo(self);
        make.left.greaterThanOrEqualTo(self);
        make.right.lessThanOrEqualTo(self);
        make.height.mas_equalTo(16);
    }];
    _messageLabel = label;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(4);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.left.greaterThanOrEqualTo(self);
        make.right.lessThanOrEqualTo(self);
    }];
}

@end
