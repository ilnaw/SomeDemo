//
//  AlertWindowVC.m
//  TestOCProject
//
//  Created by wl on 2019/5/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "AlertWindowVC.h"
#import "YLPopQueueManager.h"
#import "NSMutableArray+Queue_Stack.h"
#import "YLAdCountHelper.h"
#import "EmptyView.h"
#import "AttributeStrView.h"
#import "YLWeekDestinyView.h"
#import "YLCircelCountView.h"

@interface AlertWindowVC ()
@property (nonatomic, strong)YLCircelCountView *countView;
@end

@implementation AlertWindowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"==========================task 华丽的分割线=====================================");
    
    dispatch_block_t task1 = ^{
        UIAlertController *alert = [self creatAlertWithTitle:@"task1" message:@"111111111111111111" style:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:true completion:nil];
    };
    dispatch_block_t task2 = ^{
        UIAlertController *alert = [self creatAlertWithTitle:@"task2" message:@"22222222222222222222" style:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:true completion:nil];
    };
    dispatch_block_t task3 = ^{
        UIAlertController *alert = [self creatAlertWithTitle:@"task3" message:@"333333333333333333333" style:UIAlertControllerStyleActionSheet];
        [self presentViewController:alert animated:true completion:nil];
    };
    
//    [[YLPopQueueManager shared]addTask:task1];
//    [[YLPopQueueManager shared]addTask:task2 priority:YLPopTaskPriorityLow];
//    [[YLPopQueueManager shared]addTask:task3 priority:YLPopTaskPriorityHigh];
    
//    [[YLPopQueueManager shared] startTaskQueue];
//    EmptyView *view = [[EmptyView alloc]init];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.centerY.equalTo(self.view).multipliedBy(0.8);
//        make.height.equalTo(@(160));
//    }];
    
    AttributeStrView *view = [[AttributeStrView alloc]init];
    [self.view addSubview:view];
    CGFloat height = ceilf([view.contentLabel.attributedText boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@(64));
        make.height.mas_equalTo(height);
    }];
    
//    YLCircelCountView *view = [YLCircelCountView viewWithCountDown:10];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(@(64));
//        make.height.mas_equalTo(100);
//    }];
//    [view start];
//    _countView = view;
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setTitle:@"button" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.countView.mas_bottom).offset(10);
//        make.centerX.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(100, 30));
//    }];
}

- (void)buttonClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
    sender.selected ? [self.countView pasued] : [self.countView reStart];
}

- (UIAlertController *)creatAlertWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:true completion:nil];
        [[YLPopQueueManager shared]resetTaskQueueStatus:YLPopTaskQueueStatusIdle];
    }];
    [alert addAction:action];
    
    return alert;
}

@end
