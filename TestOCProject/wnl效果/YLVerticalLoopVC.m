//
//  YLVerticalLoopVC.m
//  TestOCProject
//
//  Created by wl on 2019/7/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLVerticalLoopVC.h"
#import "YLVerticalLoopView.h"
#import "YLPreWarningLoopView.h"
#import "YLLoopExp.h"

@interface YLVerticalLoopVC ()<YLVerticalLoopViewDataSource>
@property (nonatomic, strong)YLVerticalLoopView *loop;
@property (nonatomic, strong)NSArray *data;
@property (nonatomic, strong)YLPreWarningLoopView *loop2;
@property (nonatomic, strong)YLLoopExp *exp;
@end

@implementation YLVerticalLoopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    self.data = @[
                  @"1111111",
                  @"2222222",
                  @"3333333",
                  @"4444444",
                  @"5555555",
                  @"6666666",
                  @"77777",
                  @"8888",
                  @"9999",
                  @"aaaaa",
                  @"bbbbbb",
                  @"ccccc",
                  ];
    
//    self.loop = [[YLVerticalLoopView alloc]init];
//    [self.view addSubview:self.loop];
//    self.loop.dataSource = self;
//
//    [self.loop startTimer];
    
//    self.loop2 = [[YLPreWarningLoopView alloc]init];
//    self.loop2.datas = self.data;
//    [self.view addSubview:self.loop2];

    self.exp = [[YLLoopExp alloc]init];
    [self.view addSubview:self.exp];
    self.exp.colors = @[
                        [UIColor redColor],
                        [UIColor blueColor],
                        [UIColor greenColor]
                        ];
    [self.exp startTimer];
}

- (NSInteger)ylVerticalLoopViewNumberOfViews
{
    return self.data.count;
}
- (UIView *)ylVerticalLoopView:(YLVerticalLoopView *)loopView viewAtIndex:(NSInteger)index
{
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 0, 100, 50);
    label.textColor = [UIColor blackColor];
    label.text = self.data[index];
    return label;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.loop.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
//    self.loop2.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
    self.exp.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
