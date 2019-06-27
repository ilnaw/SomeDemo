//
//  YLMomentVideo.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentVideo.h"

@interface YLMomentVideo()
@property (nonatomic, strong)UILabel *titleLabel;
@end

@implementation YLMomentVideo
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

- (void)configUI
{
    [super configUI];
    self.backgroundColor = [UIColor orangeColor];
    self.titleLabel = ({
        UILabel *label = UILabel.new;
        label.text = @"这是视频";
        
        label;
    });
    [self addSubview:self.titleLabel];
}

- (void)refreshData:(YLMomentModel *)model
{
    self.model = model;
    [self layoutIfNeeded];
}
@end
