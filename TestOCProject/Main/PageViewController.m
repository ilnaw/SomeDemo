//
//  PageViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@end

@implementation PageViewController

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary<NSString *,id> *)options
{
    self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void (^)(NSString * _Nonnull))block1
{
    return ^(NSString *name){
        NSLog(@"------------------------name");
    };
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.vcs indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index --;
    return self.vcs[index];
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.vcs indexOfObject:viewController];
    if (index == self.vcs.count - 1 || index == NSNotFound) {
        return nil;
    }
    index ++;
    return  self.vcs[index];
}

@end
