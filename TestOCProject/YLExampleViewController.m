//
//  ExampleViewController.m
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLExampleViewController.h"

NSString *const kUUID = @"djkad12312fasdad21312";
NSString *const kNoSure = @"no";

static NSString *const kReuseIdentify = @"cell";
static const NSTimeInterval kAnimationDuration = 3.0;

@interface YLExampleViewController ()
{
    BOOL _privateVariable;
}
@property (nonatomic, assign)NSUInteger index;
@end

@implementation YLExampleViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [UIView animateWithDuration:kAnimationDuration animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - public method

#pragma mark - private method

#pragma mark - dataSource and delegate

#pragma mark - properties

#pragma mark - NSCopying
@end
