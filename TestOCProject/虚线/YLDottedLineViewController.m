//
//  YLDottedLineViewController.m
//  TestOCProject
//
//  Created by wl on 2019/7/18.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLDottedLineViewController.h"
#import "YLDottedLine.h"

@interface YLDottedLineViewController ()
@property (nonatomic, strong)YLDottedLine *line;
@property (nonatomic, strong)YLDottedLine *line2;
@end

@implementation YLDottedLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YLDottedLine *line = [YLDottedLine new];
    line.lineWidth = 5;
    line.dotWidth = 20;
    [self.view addSubview:line];
    self.line = line;
    
    YLDottedLine *line2 = [YLDottedLine new];
    line2.horizontal = NO;
    line2.dotWidth = 15;
    [self.view addSubview:line2];
    self.line2 = line2;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.line.frame = CGRectMake(0, 100, self.view.yl_width, 10);
    
    self.line2.frame = CGRectMake(100, 110, 10, self.view.yl_height - 110);
}

@end
