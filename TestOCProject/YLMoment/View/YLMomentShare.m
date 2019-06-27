//
//  YLMomentShare.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentShare.h"

@interface YLMomentShare()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *shareTitle;
@end

@implementation YLMomentShare
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
    self.imageView.yl_size = CGSizeMake(40, 40);
    self.imageView.centerY = CGRectGetMidY(self.bounds);
    self.imageView.left = 15;

    self.shareTitle.yl_size = CGSizeMake(self.bounds.size.width, self.yl_height);
    self.shareTitle.left = self.imageView.right + 15;
    self.shareTitle.centerY = CGRectGetMidY(self.bounds);

}

- (void)configUI
{
    [super configUI];
    self.backgroundColor = [UIColor lightGrayColor];
    self.imageView = ({
        UIImageView *image = [UIImageView new];
        
        image;
    });
    [self addSubview:self.imageView];
    
    self.shareTitle = ({
        UILabel *label = UILabel.new;
        
        label;
    });
    [self addSubview:self.shareTitle];
}

- (void)refreshData:(YLMomentModel *)model
{
    self.model = model;
    self.shareTitle.text = @"这是分享链接";
    self.imageView.image = [UIImage imageNamed:@"v472_task_500_icon"];
    [self layoutIfNeeded];
}

- (void)containerDidTouchUpInside{
    if ([self.delegate respondsToSelector:@selector(catchEvent:)]) {
        YLMomentEvent *event = YLMomentEvent.new;
        event.eventName = YLMomentEventNameTapShare;
        event.model = self.model;
        [self.delegate catchEvent:event];
    }
}

@end
