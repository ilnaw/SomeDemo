//
//  PGTwoViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "PGTwoViewController.h"

@interface PGTwoViewController ()
@property (strong, nonatomic)UILabel *nameLabel;
@property (strong, nonatomic)UIScrollView *scrollView;
@end

@implementation PGTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.nameLabel];
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
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _nameLabel.center = self.view.center;
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
    }
    return _scrollView;
}


@end
