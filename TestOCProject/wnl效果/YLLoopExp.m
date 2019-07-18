//
//  YLLoopExp.m
//  TestOCProject
//
//  Created by wl on 2019/7/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLLoopExp.h"
@interface YLLoopExp()
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)NSMutableArray *containerViews;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation YLLoopExp

- (void)dealloc
{
    [self stopTimer];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _initUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(self.yl_width, self.yl_height*self.containerViews.count);
    [self.containerViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        view.frame = CGRectMake(0, idx*self.yl_height, self.yl_width, self.yl_height);
    }];
}

- (void)_initUI{
    [self addSubview:self.scrollView];
}

- (void)_tick{
    CGFloat offsetY = self.scrollView.contentOffset.y;
    NSInteger scrollViewIndex = offsetY / self.yl_height;
    NSLog(@"----offsetY:%.2f",self.scrollView.contentOffset.y);
    NSLog(@"-------index:%ld",scrollViewIndex);
    
    [self.scrollView setContentOffset:CGPointMake(0, (scrollViewIndex + 1) * self.yl_height) animated:YES];

    if (scrollViewIndex >= self.colors.count - 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.scrollView setContentOffset:CGPointZero];
        });
        
        NSLog(@"----offsetY:%.2f",self.scrollView.contentOffset.y);
    }
}


- (void)startTimer{
    if (_timer) {return;}

    for (int i = 0; i < self.colors.count + 1; i++) {
        UIView *container = UIView.new;
        if (i == self.colors.count) {
            container.backgroundColor = self.colors.firstObject;
        }else{
            container.backgroundColor = self.colors[i];
        }
        
        [self.scrollView addSubview:container];
        [self.containerViews addObject:container];
    }
    
    [self layoutIfNeeded];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(_tick) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];

}

- (void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}



- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.scrollEnabled = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (NSMutableArray *)containerViews
{
    if (!_containerViews) {
        _containerViews = @[].mutableCopy;
    }
    return _containerViews;
}


@end
