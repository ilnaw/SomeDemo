//
//  WLTransitioningController.h
//  TestOCProject
//
//  Created by wanli on 2019/3/26.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLTransitioningController : NSObject<UIViewControllerAnimatedTransitioning>
+ (instancetype)type:(UINavigationControllerOperation)type;
@end

NS_ASSUME_NONNULL_END
