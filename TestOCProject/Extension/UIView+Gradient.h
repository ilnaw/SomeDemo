//
//  UIView+Gradient.h
//  CFGradientLabelDemo
//
//  Created by wl on 2019/6/11.
//  Copyright © 2019年 于 传峰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gradient)
- (void)gradientColors:(NSArray *)colors
            startPoint:(CGPoint)startPoint
              endPoint:(CGPoint)endPoint;
@end

NS_ASSUME_NONNULL_END
