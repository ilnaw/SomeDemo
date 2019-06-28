//
//  PageViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "PageViewController.h"
#import "PGOneViewController.h"
#import "PGTwoViewController.h"
#import "PGThreeViewController.h"

@interface PageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate>
@property (strong, nonatomic)NSArray <UIViewController*> *vcs;
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
- (void)setData
{
    PGOneViewController *vc = [[PGOneViewController alloc]init];
    vc.scrollDelegate = self;
    
    PGTwoViewController *vc2 = [[PGTwoViewController alloc]init];
    vc2.scrollDelegate = self;

    PGThreeViewController *vc3 = [[PGThreeViewController alloc]init];
    vc3.scrollDelegate = self;
    
    self.vcs =  @[
                         vc,
                         vc2,
                         vc3
                         ];
    [self setViewControllers:@[self.vcs.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.gestureAbled) {
        [scrollView setContentOffset:CGPointZero];
    }
    scrollView.showsVerticalScrollIndicator = self.gestureAbled;
}

- (void)setScrollViewGestureEnaled:(BOOL)enabled{
    self.gestureAbled = enabled;
}

- (void)scrollToTop{
    UIViewController<PageScrollViewDelegate> *vc = (UIViewController<PageScrollViewDelegate> *)self.viewControllers.firstObject;
    [vc.sc setContentOffset:CGPointZero animated:YES];
}
@end
