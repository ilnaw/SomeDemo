//
//  ScrollOffsetViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/8.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "ScrollOffsetViewController.h"
#import "UIView+WXFrame.h"

@interface ScrollOffsetViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIView *indicator;
@end

@implementation ScrollOffsetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *containerView = [UIView new];
    [scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.height.equalTo(scrollView);
    }];
    
    UIView *left = [UIView new];
    left.backgroundColor = [UIColor redColor];
    [containerView addSubview:left];
    
    UIView *right = [UIView new];
    right.backgroundColor = [UIColor blueColor];
    [containerView addSubview:right];
    
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(containerView);
        make.width.mas_equalTo(UIScreen.mainScreen.bounds.size.width);
    }];
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(left.mas_right);
        make.top.bottom.equalTo(containerView);
        make.width.mas_equalTo(UIScreen.mainScreen.bounds.size.width);
        make.right.equalTo(containerView.mas_right);
    }];

    UIView *indicator = [[UIView alloc]init];
    indicator.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:indicator];
    _indicator = indicator;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _indicator.centerX = self.view.centerX - 50;
    _indicator.top = 100;
    _indicator.yl_size = CGSizeMake(15, 4);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
   
    CGFloat maxWidth = 40;
    CGFloat minWidth = 15;
    CGFloat originCenterX = self.view.centerX - 50;
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat mid = screenWidth/2.0;
    
    CGFloat percent =  (mid - ABS(mid - offsetX)) / mid;
    
    CGFloat currentWidth = (maxWidth - minWidth) * percent + minWidth;
    
    _indicator.yl_width = currentWidth;
    _indicator.centerX = originCenterX + offsetX / screenWidth * 100 ;
   
}

@end
