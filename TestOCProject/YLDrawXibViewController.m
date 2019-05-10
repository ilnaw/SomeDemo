//
//  YLDrawXibViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLDrawXibViewController.h"
#import "YLWeekDestinyView.h"

@interface YLDrawXibViewController ()
@property (weak, nonatomic) IBOutlet YLWeekDestinyView *weekView;

@end

@implementation YLDrawXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.weekView.scores = @[@(40),@(60),@(50),@(50),@(20),@(50),@(90)];
        [self.weekView setNeedsDisplay];
    });
}

@end
