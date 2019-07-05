//
//  MathViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "MathViewController.h"
#import "NSMutableArray+Queue_Stack.h"
#import "YLIMManager.h"

@interface MathViewController ()
@property (nonatomic,strong)NSMutableArray  *queue;
@property (nonatomic,assign)NSTimeInterval after3Seconds;
@end

@implementation MathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self _mathTwoSum:@[@1,@2,@3,@4,@5,@6] target:9];
    
    self.queue = @[].mutableCopy;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_sendMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
}

- (void)_sendMessage{
//    if (![[YLIMManager shared] canSendTextBySendSpacing:3
//                                           timeInterval:2
//                                              limitTime:3]) {
//        NSLog(@"-----不能发送");
//    }
}

- (void)_mathTwoSum:(NSArray <NSNumber *>*)array target:(NSInteger)target{
    for (int i = 0; i < array.count; i++) {
        NSInteger first = [array[i] integerValue];
        for (int j = 0; j < array.count; j++) {
            if (j != i) {
                NSInteger second = [array[j] integerValue];
                if (first + second == target) {
                    NSLog(@"index first=%ld seconde=%ld",first,second);
                }
            }
        }
    }
}
@end
