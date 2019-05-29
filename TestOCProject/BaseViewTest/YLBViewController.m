//
//  YLBViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLBViewController.h"
#import "YLRedView.h"
#import "YLBlueView.h"
#import "YLCView.h"

@interface YLBViewController ()

@end

@implementation YLBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YLBaseView *view = [YLBaseView creatWithInt:1];
    view.posid = @"123";
    [view updateUI];
    view.frame = CGRectMake(100, 100, 180, 50);
    [self.view addSubview:view];
    
    YLBaseView *view2 = [YLBaseView creatWithInt:0];
    view2.posid = @"2222";
    [view2 updateUI];
    view2.frame = CGRectMake(100, 170, 180, 50);
    [self.view addSubview:view2];

    YLCView *view3 = [YLCView new];
    view3.frame = CGRectMake(100, 250, 180, 50);
    view3.posid = @"8888";
    [self.view addSubview:view3];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

@end
