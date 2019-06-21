//
//  UIView+Gradient.m
//  CFGradientLabelDemo
//
//  Created by wl on 2019/6/11.
//  Copyright © 2019年 于 传峰. All rights reserved.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (CAGradientLayer *)beforeLayer{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBeforeLayer:(CAGradientLayer *)beforeLayer{
    objc_setAssociatedObject(self, @selector(beforeLayer), beforeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)gradientColors:(NSArray *)colors
            startPoint:(CGPoint)startPoint
              endPoint:(CGPoint)endPoint{
    if (self.beforeLayer) {
        [self.beforeLayer removeFromSuperlayer];
    }
    
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.frame;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    [self.superview.layer addSublayer:gradientLayer];
    gradientLayer.mask = self.layer;
    self.frame = gradientLayer.bounds;
    
    self.beforeLayer = gradientLayer;
}
@end
