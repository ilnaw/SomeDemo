//
//  YLCoinViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/14.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCoinViewController.h"
#import <UICountingLabel/UICountingLabel.h>
#import "YLCoinProgressView.h"

@interface YLCoinViewController ()

@end

@implementation YLCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UICountingLabel *label = [UICountingLabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    
    label.formatBlock = ^NSString *(CGFloat value) {
        NSString *floatStr = [NSString stringWithFormat:@"%.2f",value];
        NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        return  [numberFormatter stringFromNumber:@([floatStr floatValue])];
    };
    [label countFrom:1.0 to:3000.222 withDuration:1.5];
    
    YLCoinProgressView *progress = [[YLCoinProgressView alloc]init];
    progress.descArrays = @[@"100",@"200",@"500",@"1000",@"1500",@"2000",@"3000"];
    [self.view addSubview:progress];
    [progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(100));
    }];
    
    
    progress.progress = (5 - 1)/6.f;
}

@end
