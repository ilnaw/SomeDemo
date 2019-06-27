//
//  YLAnimationButton.m
//  TestOCProject
//
//  Created by wl on 2019/6/26.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLAnimationButton.h"

@interface YLAnimationButton()
@property (nonatomic, strong)UIImageView *animationImageView;
@end

@implementation YLAnimationButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageview = [[UIImageView alloc]init];
        imageview.hidden = YES;
        [self addSubview:imageview];
        self.animationImageView = imageview;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.animationImageView.frame = self.imageView.frame;
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (!self.allowAnimation) {
        [super sendAction:action
                       to:target
                 forEvent:event];
        return;
    }
    
    self.animationImageView.hidden = NO;
    self.animationImageView.image = [self imageForState:UIControlStateHighlighted];
    self.animationImageView.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateWithDuration:0.25 animations:^{
        self.animationImageView.transform = CGAffineTransformScale(self.imageView.transform, 0.4, 0.4);
    }completion:^(BOOL finished) {
        self.animationImageView.transform = CGAffineTransformIdentity;
        self.animationImageView.hidden = YES;
        [super sendAction:action
                       to:target
                 forEvent:event];
    }];
}

@end
