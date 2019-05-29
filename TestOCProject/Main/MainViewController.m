//
//  MainViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "MainViewController.h"
#import "PageViewController.h"
#import "BaseScrollView.h"
#import "BottomViewController.h"
#import "WLTransitioning.h"
#import "TableViewController.h"

@interface MainViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,UIViewControllerTransitioningDelegate>
@property (strong, nonatomic)BaseScrollView *scrollView;
@property (strong, nonatomic)UILabel    *calenderLabel;
@property (strong, nonatomic)PageViewController *pageVC;
@property (strong, nonatomic)WLTransitioning *modelTransitioning;
@property (strong, nonatomic)UIPanGestureRecognizer *moveDown;
@property (strong, nonatomic)CustomNavigationBar *navigationBar;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.canScroll = true;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:false];
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.calenderLabel];
    [self addChildViewController:self.pageVC];
    [self.scrollView addSubview:self.pageVC.view];
    [self.view addSubview:self.navigationBar];
    
    [self.pageVC setData];
    self.pageVC.block1(@"1");
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];

    [self.view addGestureRecognizer:self.moveDown];
    self.fd_prefersNavigationBarHidden = true;
    self.navigationController.delegate = self.modelTransitioning;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat naviHeight = UIApplication.sharedApplication.statusBarFrame.size.height + 44;
    self.scrollView.frame = CGRectMake(0, naviHeight, self.view.frame.size.width, self.view.frame.size.height - naviHeight);
    self.calenderLabel.frame = CGRectMake(0, 0, self.view.frame.size.width, 500);
    self.pageVC.view.frame = CGRectMake(0, 500, self.view.frame.size.width, self.view.frame.size.height);
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 500);
}

- (void)panChange:(UIPanGestureRecognizer *)gesture
{
    CGFloat offset = [gesture translationInView:self.view].y;
    CGFloat percent = offset/self.view.frame.size.height;
    CGFloat speed = [gesture velocityInView:self.view].y;

    if (self.scrollView.contentOffset.y == 0) {
        switch ([gesture state]) {
            case UIGestureRecognizerStateBegan:{
                if (speed <= 0) {
                    return;
                }
                self.scrollView.scrollEnabled = false;
                self.modelTransitioning.interactive = true;
                [self model];
            }
                break;
            case UIGestureRecognizerStateChanged:
                [self.modelTransitioning.interactionController updateInteractiveTransition:percent];
                break;
            case UIGestureRecognizerStateFailed:
            case UIGestureRecognizerStateCancelled:
            case UIGestureRecognizerStateEnded:
                self.scrollView.scrollEnabled = true;
                self.modelTransitioning.interactive = false;
                if (percent > 0.2 || speed > 800) {
                    [self.modelTransitioning.interactionController finishInteractiveTransition];
                }
                else
                {
                    [self.modelTransitioning.interactionController cancelInteractiveTransition];
                }
                break;
            default:
                self.modelTransitioning.interactive = false;
                break;
        }
    }
}

- (void)model{
    BottomViewController *vc = [[BottomViewController alloc]init];
//    vc.transitioningDelegate = self.modelTransitioning;
    [self.navigationController pushViewController:vc animated:true];
//    [self presentViewController:vc animated:true completion:nil];
}

- (void)backToTop
{
    [self.scrollView setContentOffset:CGPointZero animated:true];
    [self.pageVC setScrollViewGestureEnaled:NO];
    [self.pageVC scrollToTop];
}

- (void)changeScrollStatus
{
//    self.canScroll = true;
}

#pragma mark - delegate and dataSource
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;

    CGFloat height = 500;
    //scrollView 嵌套
    if (offset >= height) {
         [scrollView setContentOffset:CGPointMake(0, height)];
        if (!self.pageVC.gestureAbled) {
            [self.pageVC setScrollViewGestureEnaled:YES];
        }
    }
    else
    {
        if (self.pageVC.gestureAbled) {
            [scrollView setContentOffset:CGPointMake(0, height)];
        }
    }

    if (offset <= 0) {
        [scrollView setContentOffset:CGPointZero];
    }
    self.scrollView.showsVerticalScrollIndicator = !self.pageVC.gestureAbled;
}



#pragma mark - getter
- (BaseScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[BaseScrollView alloc]init];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.tag = 1001;
        _scrollView.delegate = self;
    }
    return _scrollView;
}
- (UILabel *)calenderLabel
{
    if (!_calenderLabel) {
        _calenderLabel = [[UILabel alloc]init];
        _calenderLabel.text = @"这是日历";
        _calenderLabel.textAlignment = NSTextAlignmentCenter;
        _calenderLabel.userInteractionEnabled = true;
    }
    return _calenderLabel;
}
- (PageViewController *)pageVC
{
    if (!_pageVC) {
        _pageVC = [[PageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    }
    return _pageVC;
}
- (WLTransitioning *)modelTransitioning
{
    if (!_modelTransitioning) {
        _modelTransitioning = [[WLTransitioning alloc]init];
    }
    return _modelTransitioning;
}
- (UIPanGestureRecognizer *)moveDown
{
    if (!_moveDown) {
        _moveDown = ({
            UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panChange:)];
            
            panGesture;
        });
    }
    return _moveDown;
}
- (CustomNavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        __weak MainViewController *weakSelf = self;
        _navigationBar.settingBlock = ^{
            __strong MainViewController *strongSelf = weakSelf;
            [strongSelf backToTop];
        };
        _navigationBar.tag = 1000;
    }
    return _navigationBar;
}
@end
