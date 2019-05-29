//
//  PGTwoViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "PGTwoViewController.h"

@interface PGTwoViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)UILabel *nameLabel;
@property (strong, nonatomic)UIScrollView *scrollView;
@end

@implementation PGTwoViewController
@synthesize scrollDelegate;

- (UIScrollView *)sc
{
    return  self.scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.nameLabel];
    NSLog(@"------------222222%@",NSStringFromSelector(_cmd));
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"------------222222%@",NSStringFromSelector(_cmd));
}
#pragma mark - getter and setter
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 100, 20)];
        _nameLabel.text = @"222";
        _nameLabel.font = [UIFont systemFontOfSize:20];
    }
    return _nameLabel;
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 900);
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.scrollDelegate scrollViewDidScroll:scrollView];
}

@end
