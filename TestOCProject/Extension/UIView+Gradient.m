//
//  UIView+Gradient.m
//  CFGradientLabelDemo
//
//  Created by wl on 2019/6/11.
//  Copyright © 2019年 于 传峰. All rights reserved.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (void)gradientColors:(NSArray *)colors
            startPoint:(CGPoint)startPoint
              endPoint:(CGPoint)endPoint{
    
    CAGradientLayer* gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = self.frame;
    gradientLayer1.colors = colors;
    gradientLayer1.startPoint = startPoint;
    gradientLayer1.endPoint = endPoint;
    [self.superview.layer addSublayer:gradientLayer1];
    gradientLayer1.mask = self.layer;
    self.frame = gradientLayer1.bounds;
}
@end
