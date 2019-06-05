//
//  YLShapeView.m
//  TestOCProject
//
//  Created by wl on 2019/5/31.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLShapeView.h"

@implementation YLShapeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self configShape];
}

- (void)configShape{
    CAShapeLayer *shapeLayer  = [CAShapeLayer new];
    shapeLayer.cornerRadius = 5;
    shapeLayer.strokeColor = [UIColor groupTableViewBackgroundColor].CGColor;
    shapeLayer.lineWidth = 1;
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(width, 0)];
    [path addLineToPoint:CGPointMake(width, height)];
    [path addLineToPoint:CGPointMake(0, height-20)];
    [path closePath];
    
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}
@end
