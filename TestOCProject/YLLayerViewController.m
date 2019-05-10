//
//  YLLayerViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLLayerViewController.h"
#import "YLPlanBoradView.h"

@interface YLLayerViewController ()

@end

@implementation YLLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];

    YLPlanBoradView *view = [YLPlanBoradView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


@end
