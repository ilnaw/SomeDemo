//
//  WLTransitioningController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/26.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "WLTransitioningController.h"

@interface WLTransitioningController()
@property (assign, nonatomic)UINavigationControllerOperation type;
@end
@implementation WLTransitioningController
+ (instancetype)type:(UINavigationControllerOperation)type
{
    WLTransitioningController *vc = [[WLTransitioningController alloc]init];
    vc.type = type;
    return vc;
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = transitionContext.containerView;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if (fromVC == nil || toVC == nil) {
        return;
    }
    
    CGFloat navHeight = UIApplication.sharedApplication.statusBarFrame.size.height + 44;
    CGFloat contentHeight = containerView.frame.size.height - navHeight;
    CGRect originNavRect = CGRectMake(0, 0, containerView.frame.size.width, navHeight);
    CGRect originContentRect = CGRectMake(0, navHeight, containerView.frame.size.width, contentHeight);
    CGRect toNavRect = CGRectMake(0, -navHeight, containerView.frame.size.width, navHeight);
    CGRect toContentRect = CGRectMake(0, containerView.frame.size.height, fromVC.view.frame.size.width, contentHeight);
    
    if (self.type == UINavigationControllerOperationPush) {
        [containerView addSubview:toVC.view];
        toVC.view.frame = containerView.frame;
        
        UIView *testView = [[fromVC.view viewWithTag:1001] snapshotViewAfterScreenUpdates:NO];
        UIView *navView = [[fromVC.view viewWithTag:1000] snapshotViewAfterScreenUpdates:NO];

        
        [containerView addSubview:testView];
        [containerView addSubview:navView];
    
        navView.frame = originNavRect;
        testView.frame = originContentRect;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            testView.frame = toContentRect;
            navView.frame = toNavRect;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
            if ([transitionContext transitionWasCancelled]) {
                [UIView animateWithDuration:0.4 animations:^{
                    testView.frame = originContentRect;
                    navView.frame = originNavRect;
                } completion:^(BOOL finished) {
                    [testView removeFromSuperview];
                    [navView removeFromSuperview];
                }];
            }
            else
            {
                [testView removeFromSuperview];
                [navView removeFromSuperview];
            }
        }];
    }
    if (self.type == UINavigationControllerOperationPop) {
        
        [containerView addSubview:toVC.view];
        toVC.view.hidden = true;
        
        UIView *testView = [[toVC.view viewWithTag:1001] snapshotViewAfterScreenUpdates:YES];
        UIView *navView = [[toVC.view viewWithTag:1000] snapshotViewAfterScreenUpdates:YES];
        
        [containerView addSubview:testView];
        [containerView addSubview:navView];
        
        testView.frame = toContentRect;
        navView.frame = toNavRect;

        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            navView.frame = originNavRect;
            testView.frame = originContentRect;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            if ([transitionContext transitionWasCancelled]) {
                [UIView animateWithDuration:0.4 animations:^{
                    testView.frame = toContentRect;
                    navView.frame = toNavRect;
                } completion:^(BOOL finished) {
                    [testView removeFromSuperview];
                    [navView removeFromSuperview];
                }];
            }
            else
            {
                toVC.view.hidden = false;
                [testView removeFromSuperview];
                [navView removeFromSuperview];
            }
        }];
    }
}
@end
