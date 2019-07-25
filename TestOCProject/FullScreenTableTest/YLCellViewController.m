//
//  YLCellViewController.m
//  TestOCProject
//
//  Created by wl on 2019/7/25.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCellViewController.h"

@interface YLCellViewController ()

@end

@implementation YLCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSLog(@"cellVC-----------------------%@",NSStringFromSelector(_cmd));
}
@end
