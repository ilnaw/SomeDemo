//
//  YLDottedLine.m
//  TestOCProject
//
//  Created by wl on 2019/7/18.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLDottedLine.h"

@interface YLDottedLine()

@end

@implementation YLDottedLine

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineWidth = 2;
        self.round = NO;
        self.horizontal = YES;
        self.lineColor = [UIColor lightGrayColor];
        self.dotWidth = self.lineWidth;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath new];
    path.lineWidth = self.lineWidth;
    [self configurePath:path rect:rect];
    [self.lineColor setStroke];
    [path stroke];
}

- (void)configurePath:(UIBezierPath *)path rect:(CGRect)rect{
    if (self.horizontal) {
        CGFloat center = rect.size.height * 0.5;
        CGFloat drawWidth = rect.size.width - fmod(rect.size.width, (self.dotWidth * 2)) + self.dotWidth;
        CGFloat startX = (rect.size.width - drawWidth) * 0.5 + self.dotWidth;
        
        [path moveToPoint:CGPointMake(startX, center)];
        [path addLineToPoint:CGPointMake(drawWidth, center)];
    }else{
        CGFloat center = rect.size.width * 0.5;
        CGFloat drawHeight = rect.size.height - fmod(rect.size.height, (self.dotWidth * 2)) + self.dotWidth;
        CGFloat startY = (rect.size.height - drawHeight) * 0.5 + self.dotWidth;
        
        [path moveToPoint:CGPointMake(center, startY)];
        [path addLineToPoint:CGPointMake(center, drawHeight)];
    }
    
    CGFloat dashs[] = {self.dotWidth, self.dotWidth};
    [path setLineDash:dashs count:2 phase:0];
    [path setLineCapStyle:self.round ? kCGLineCapRound : kCGLineCapButt];
}

@end
