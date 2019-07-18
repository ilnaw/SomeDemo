//
//  YLVerticalLoopView.m
//  TestOCProject
//
//  Created by wl on 2019/7/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLVerticalLoopView.h"

@interface YLVerticalLoopView()
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)NSMutableArray *containerViews;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, strong)NSMutableDictionary *loopViews;
@property (nonatomic, assign)NSInteger count;
@property (nonatomic, assign)NSInteger currentIndex;
@end

@implementation YLVerticalLoopView

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
    self.scrollView.contentSize = CGSizeMake(self.yl_width, self.yl_height*3);
    [self.containerViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        view.frame = CGRectMake(0, idx*self.yl_height, self.yl_width, self.yl_height);
    }];
}

- (void)_initUI{
    [self addSubview:self.scrollView];
    for (int i = 0; i < 3; i++) {
        UIView *container = UIView.new;
        [self.scrollView addSubview:container];
        [self.containerViews addObject:container];
    }
}

- (void)_tick{
    CGFloat offsetY = self.scrollView.contentOffset.y;
    NSInteger scrollViewIndex = offsetY / self.yl_height;
    
    [self.scrollView setContentOffset:CGPointMake(0, (scrollViewIndex + 1) * self.yl_height) animated:YES];
    if (scrollViewIndex >= 1) {
        self.currentIndex ++;
        if (self.currentIndex > self.count - 1) {
            self.currentIndex = 0;
        }
        [self _resetLoopViews];
        
        [self.scrollView setContentOffset:CGPointZero];
    }
}

- (void)_resetLoopViews{
    
    UIView *firstView = self.containerViews[0];
    UIView *nextView = self.containerViews[1];
    UIView *copyNextView = self.containerViews[2];
    [firstView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [nextView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [copyNextView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    [firstView addSubview:[self _viewAtIndex:self.currentIndex]];
    [nextView addSubview:[self _viewAtIndex:[self _next]]];
    [copyNextView addSubview:[self _viewAtIndex:[self _next] copy:YES]];
    
}

- (NSInteger)_next{
    NSInteger index = self.currentIndex + 1;
    if (index > self.count - 1) {
        index = 0;
    }
    return index;
}

- (UIView *)_viewAtIndex:(NSInteger)index{
    return [self _viewAtIndex:index copy:NO];
}

- (UIView *)_viewAtIndex:(NSInteger)index copy:(BOOL)copy{
    NSString *key = [NSString stringWithFormat:@"%ld",(long)index];
    if (copy) {
        key = [NSString stringWithFormat:@"copy_%ld",(long)index];
    }
    UIView *view = self.loopViews[key];
    if (!view) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
        view = [self.dataSource ylVerticalLoopView:self viewAtIndex:index];
        [self.loopViews setObject:view forKey:key];
    }
    return view;
}

- (void)startTimer{
    if (_timer) {return;}
    if (self.timeInterval == 0) {self.timeInterval = 3;}
    self.count = [self.dataSource ylVerticalLoopViewNumberOfViews];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(_tick) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    [self _resetLoopViews];
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

- (NSMutableDictionary *)loopViews
{
    if (!_loopViews) {
        _loopViews = @{}.mutableCopy;
    }
    return _loopViews;
}

@end
