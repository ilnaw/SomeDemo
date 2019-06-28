//
//  ExampleViewController.m
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLExampleViewController.h"
#import "UIView+Gradient.h"

NSString *const kUUID = @"djkad12312fasdad21312";
NSString *const kNoSure = @"no";

static NSString *const kReuseIdentify = @"cell";
static const NSTimeInterval kAnimationDuration = 3.0;

@interface YLExampleViewController ()
{
    BOOL _privateVariable;
}
@property (nonatomic, assign)NSUInteger index;
@property (nonatomic, strong)UILabel *testLabel;
@end

@implementation YLExampleViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UILabel *label = UILabel.new;
    NSMutableAttributedString *amount = [[NSMutableAttributedString alloc]initWithString:@"123元"];
    [amount addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 3)];
    [amount addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(3, 1)];
    label.attributedText = amount;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.centerX.equalTo(self.view);
    }];
    self.testLabel = label;

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.testLabel gradientColors:@[(__bridge id)UIColor.redColor.CGColor,(__bridge id)UIColor.blueColor.CGColor]
                        startPoint:CGPointMake(0.5, 0)
                          endPoint:CGPointMake(0.5, 1)];
}

#pragma mark - public method

#pragma mark - private method

#pragma mark - dataSource and delegate

#pragma mark - properties

#pragma mark - NSCopying
@end
