//
//  YLIMMessageImageView.m
//  TestOCProject
//
//  Created by wl on 2019/6/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageImageView.h"
#import "YLIMMessageModel.h"

@interface YLIMMessageImageView()
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation YLIMMessageImageView

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
    imageView.layer.masksToBounds = true;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.left = self.model.layout.bubbleViewInsets.left;
    self.imageView.top = self.model.layout.bubbleViewInsets.top;
    self.imageView.yl_size = self.model.layout.contentSize;
}

- (void)refreshData:(YLIMMessageModel *)model
{
    self.model = model;
    self.imageView.image = [UIImage imageNamed:self.model.message.url];
}

- (void)bubbleTouchUpInside:(id)sender{
    if ([self.delegate respondsToSelector:@selector(onEvent:)]) {
        [self.delegate onEvent:self.model.message];
    }
}
@end
