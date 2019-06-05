//
//  UIView+DotBadge.h
//  TestOCProject
//
//  Created by wl on 2019/5/31.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DotBadge)

- (void)showDotBadge;

- (void)showDotWithCorner:(UIRectCorner)corner
                   offset:(CGPoint)point;

- (void)showDotWithCorner:(UIRectCorner)corner
                   offset:(CGPoint)point
                 imageUrl:(nullable NSString *)imageUrl;

- (void)clearDotBadge;

@end

NS_ASSUME_NONNULL_END
