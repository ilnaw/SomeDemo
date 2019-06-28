//
//  BottomViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/26.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "BottomViewController.h"

@interface BottomViewController ()
@property (strong, nonatomic)UIButton   *dismissButton;
@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.fd_prefersNavigationBarHidden = YES;
    
    [self.view addSubview:self.dismissButton];
    
    NSLog(@"=================");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"================= viewwillAPper");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.dismissButton.frame = CGRectMake(0, 0, 200, 100);
    self.dismissButton.center = self.view.center;
}

- (void)dismissVC
{
//    [self dismissViewControllerAnimated:true completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - getter
- (UIButton *)dismissButton
{
    if (!_dismissButton) {
        _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dismissButton setTitle:@"bottomVC dismiss" forState:UIControlStateNormal];
        [_dismissButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_dismissButton addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissButton;
}
@end
