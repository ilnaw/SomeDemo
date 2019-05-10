//
//  YLDrawDestinyViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/8.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLDrawDestinyViewController.h"
#import "YLWeekDestinyView.h"


@interface YLDrawDestinyViewController ()

@end

@implementation YLDrawDestinyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YLWeekDestinyView *drawView = [YLWeekDestinyView new];
    [self.view addSubview:drawView];
    [drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(300);
    }];
    drawView.scores = @[@(50),@(50),@(50),@(50),@(50),@(50),@(50)];
    [drawView setNeedsDisplay];
    
}

@end
