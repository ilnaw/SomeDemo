//
//  PGThreeViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "PGThreeViewController.h"

@interface PGThreeViewController ()
@property (strong, nonatomic)UILabel *nameLabel;
@end

@implementation PGThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.nameLabel];
    NSLog(@"------------33333%@",NSStringFromSelector(_cmd));
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"------------333333%@",NSStringFromSelector(_cmd));
}
#pragma mark - getter and setter
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _nameLabel.center = self.view.center;
        _nameLabel.text = @"3333333";
        _nameLabel.font = [UIFont systemFontOfSize:20];
    }
    return _nameLabel;
}

@end
