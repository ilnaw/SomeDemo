//
//  YLGestureTestViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLGestureTestViewController.h"

@interface YLGestureTestViewController ()
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation YLGestureTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
    UIImageView *imageView = [UIImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)tap{
    NSLog(@"----点击了");
}

@end
