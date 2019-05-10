//
//  WLTransitioning.m
//  TestOCProject
//
//  Created by wanli on 2019/3/26.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "WLTransitioning.h"
#import "WLTransitioningController.h"

@interface WLTransitioning()
@property (strong, nonatomic)id<UIViewControllerAnimatedTransitioning>  animatedTransitioning;
@end

@implementation WLTransitioning

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[WLTransitioningController alloc]init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[WLTransitioningController alloc]init];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactive ? self.interactionController : nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
     return self.interactive ? self.interactionController : nil;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [WLTransitioningController type:operation];
}
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactive ? self.interactionController : nil;
}

#pragma mark - getter
- (UIPercentDrivenInteractiveTransition *)interactionController
{
    if (!_interactionController) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return _interactionController;
}

@end

