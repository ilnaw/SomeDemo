//
//  YLGradViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/21.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLGradViewController.h"
#import "UIView+Gradient.h"

@interface YLGradViewController ()
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UIView *container;
@end

@implementation YLGradViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *container = UIView.new;
    [self.view addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(200, 400));
    }];
    self.container = container;
    
    UILabel *label = UILabel.new;
    label.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *amount = [[NSMutableAttributedString alloc]initWithString:@"123元"];
    [amount addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 3)];
    [amount addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(3, 1)];
    label.attributedText = amount;
    [container addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.centerX.equalTo(container);
    }];
    self.label = label;

    [self.view layoutIfNeeded];
    
    [self.label gradientColors:@[(__bridge id)UIColor.greenColor.CGColor,(__bridge id)UIColor.orangeColor.CGColor]
                    startPoint:CGPointMake(0, 0)
                      endPoint:CGPointMake(0, 1)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(_action)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.equalTo(self.view);
    }];
}

- (void)_action{
    [self.container addSubview:self.label];
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.centerX.equalTo(self.container);
    }];
    
    [self.view layoutIfNeeded];
    
    [self.label gradientColors:@[(__bridge id)UIColor.greenColor.CGColor,(__bridge id)UIColor.orangeColor.CGColor]
                    startPoint:CGPointMake(0, 0)
                      endPoint:CGPointMake(0, 1)];
}



@end
