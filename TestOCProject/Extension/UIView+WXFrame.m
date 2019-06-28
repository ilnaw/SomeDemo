//
//  UIView+WXFrame.m
//  WeatherDemo
//
//  Created by youloft on 2016/12/26.
//  Copyright © 2016年 youloft. All rights reserved.
//

#import "UIView+WXFrame.h"

@implementation UIView (WXFrame)

-(void)setFrameX:(CGFloat)frameX{
    CGRect frame = self.frame;
    frame.origin.x = frameX;
    self.frame = frame;
}

-(CGFloat)frameX{
    return  self.frame.origin.x;
}

-(void)setFrameY:(CGFloat)frameY{
    CGRect frame = self.frame;
    frame.origin.y = frameY;
    self.frame = frame;
}

-(CGFloat)frameY{
    return self.frame.origin.y;
}

-(void)setBoundsX:(CGFloat)boundsX{
    CGRect bounds = self.bounds;
    bounds.origin.x = boundsX;
    self.bounds = bounds;
}

-(CGFloat)boundsX{
    return self.bounds.origin.x;
}

-(void)setBoundsY:(CGFloat)boundsY{
    CGRect bounds = self.bounds;
    bounds.origin.y = boundsY;
    self.bounds = bounds;
}

-(CGFloat)boundsY{
    return self.bounds.origin.y;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY{
    return self.center.y;
}

-(CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

-(void)setMaxX:(CGFloat)maxX {
    CGRect frame = self.frame;
    frame.origin.x = maxX - self.frame.size.width;
    self.frame = frame;
}

-(CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

-(void)setMaxY:(CGFloat)maxY {
    CGRect frame = self.frame;
    frame.origin.y = maxY - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)top { return CGRectGetMinY(self.frame); }
- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left { return CGRectGetMinX(self.frame); }
- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)bottom { return CGRectGetMaxY(self.frame); }
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.yl_height;
    self.frame = frame;
}

- (CGFloat)right { return CGRectGetMaxX(self.frame); }
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.yl_width;
    self.frame = frame;
}

-(void)setYl_width:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)yl_width{
    return self.frame.size.width;
}

-(void)setYl_height:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)yl_height{
    return self.frame.size.height;
}

- (void)setYl_size:(CGSize)yl_size
{
    CGRect frame = self.frame;
    frame.size = yl_size;
    self.frame = frame;
}

- (CGSize)yl_size
{
    return self.frame.size;
}




@end
