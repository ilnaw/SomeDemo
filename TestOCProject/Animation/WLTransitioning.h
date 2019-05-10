//
//  WLTransitioning.h
//  TestOCProject
//
//  Created by wanli on 2019/3/26.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLTransitioning : NSObject<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
@property (assign, nonatomic)BOOL interactive;
@property (strong, nonatomic)UIPercentDrivenInteractiveTransition *interactionController;


@end

NS_ASSUME_NONNULL_END
