//
//  YLLabelMarginViewController.m
//  TestOCProject
//
//  Created by wl on 2019/7/17.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLLabelMarginViewController.h"
#import "YYText.h"
#import "YLLabel.h"

@interface YLLabelMarginViewController ()

@end

@implementation YLLabelMarginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YLLabel *label = [YLLabel new];
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    label.font = [UIFont systemFontOfSize:100];
    label.text = @"250";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];

}

@end
