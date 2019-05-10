//
//  PGOneViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "PGOneViewController.h"

@interface PGOneViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)UIScrollView *scrollView;

@end

@implementation PGOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.scrollView];
    
    for (int i = 0; i < 10; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, i * 100, 100, 20)];
        label.font = [UIFont systemFontOfSize:18];
        label.text = @"新闻列表";
        [self.scrollView addSubview:label];
    }
    
    self.scrollView.mj_header = [NormalRefreshHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.scrollView.mj_header endRefreshing];
        });
    }];
    
//    NSLog(@"------------1%@",NSStringFromSelector(_cmd));
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"------------1%@",NSStringFromSelector(_cmd));
}

#pragma mark - delegate and dataSource
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%.2f",scrollView.contentOffset.y);
    if (!self.canScroll) {
        [scrollView setContentOffset:CGPointZero];
    }
    if(scrollView.contentOffset.y <= 0)
    {
        //注释为 万年历效果
//        self.canScroll = false;
//        scrollView.contentOffset = CGPointZero;
        //
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"leaveTop" object:nil];
    }
    scrollView.showsVerticalScrollIndicator = self.canScroll;
}

- (void)setCanScroll:(BOOL)canScroll
{
    _canScroll = canScroll;
    if (!_canScroll) {//如果cell不能滑动，代表到了顶部，修改所有子vc的状态回到顶部
        self.scrollView.contentOffset = CGPointZero;
    }
}

#pragma mark - getter and setter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 900);
        _scrollView.delegate = self;
    }
    return _scrollView;
}

@end
