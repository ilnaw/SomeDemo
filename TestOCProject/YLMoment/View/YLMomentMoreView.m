//
//  YLMomentMoreView.m
//  TestOCProject
//
//  Created by wl on 2019/6/26.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentMoreView.h"
#import "YLAnimationButton.h"

@interface YLMomentMoreView()
@property (nonatomic,strong)UIVisualEffectView *effectView;
@property (nonatomic,strong)YLAnimationButton *likeButton;
@property (nonatomic,strong)YLAnimationButton *commentButton;
@property (nonatomic,strong)UIView *separator;
@end

@implementation YLMomentMoreView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.clipsToBounds = YES;
        
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.effectView = [[UIVisualEffectView alloc]initWithEffect:blur];
        self.effectView.layer.cornerRadius = 4;
        self.effectView.layer.masksToBounds = YES;
        
        [self addSubview:self.effectView];
        
        self.likeButton = ({
            YLAnimationButton *button = [YLAnimationButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"wx_albumLike_20x20"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"wx_albumLikeHL_20x20"] forState:UIControlStateHighlighted];
            [button setTitle:@"赞" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:11.f]];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button addTarget:self
                       action:@selector(_likeAction)
             forControlEvents:UIControlEventTouchUpInside];
            button.allowAnimation = YES;
            
            button;
        });
        [self.effectView.contentView addSubview:self.likeButton];
        
        self.commentButton = ({
            YLAnimationButton *button = [YLAnimationButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"wx_albumCommentSingleA_20x20"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"wx_albumCommentSingleAHL_20x20"] forState:UIControlStateHighlighted];
            [button setTitle:@"评论" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:11.f]];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button addTarget:self
                       action:@selector(_commentAction)
             forControlEvents:UIControlEventTouchUpInside];
            
            button;
        });
        [self.effectView.contentView addSubview:self.commentButton];
        
        self.separator = ({
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor whiteColor];
            
            view;
        });
        [self.effectView.contentView addSubview:self.separator];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.yl_height = 40;
    self.separator.yl_width = 1;
    self.separator.yl_height = 20;
    self.effectView.yl_height = self.yl_height;
    
    self.effectView.frameX = 0;
    
    self.likeButton.yl_width = (self.effectView.yl_width - self.separator.yl_width)/2.f;
    self.likeButton.yl_height = self.effectView.yl_height;
    
    self.separator.frameY = 10;
    self.separator.frameX = self.likeButton.right;
    
    self.commentButton.left = self.separator.right;
    self.commentButton.yl_width = self.likeButton.yl_width;
    self.commentButton.yl_height = self.likeButton.yl_height;
}

- (void)_likeAction{
    if (self.likeClickedCallback) {
        self.likeClickedCallback(self);
    }
    [self hiddenAnimation:YES delay:0.25];
}
- (void)_commentAction{
    if (self.commentClickedCallback) {
        self.commentClickedCallback(self);
    }
    [self hiddenAnimation:YES delay:0.25];
}

- (void)showAnimation:(BOOL)animation
{
    if (self.isShowing) {
        return;
    }
    self.showing = YES;
    
    if (!animation) {
        self.yl_width = 140;
        self.frameX = self.frameX - self.yl_width;
        return;
    }
    
    [UIView animateWithDuration:0.25
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear animations:^{
                            self.yl_width = 140;
                            self.frameX = self.frameX - self.yl_width;
                            self.effectView.yl_width = self.yl_width;
    } completion:^(BOOL finished) {
       
    }];
}

- (void)hiddenAnimation:(BOOL)animation{
    [self hiddenAnimation:animation delay:0.f];
}

- (void)hiddenAnimation:(BOOL)animation delay:(NSTimeInterval)delay
{
    if (!self.isShowing) {
        return;
    }
    
    if (!animation) {
        self.showing = NO;
        self.frameX = self.frameX + self.yl_width;
        self.yl_width = 0;
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25
                              delay:0
             usingSpringWithDamping:0.75
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear animations:^{
                                self.frameX = self.frameX + self.yl_width;
                                self.yl_width = 0;
                                self.effectView.yl_width = self.yl_width;
                            } completion:^(BOOL finished) {
                                 self.showing = NO;
                            }];
    });
}
@end
