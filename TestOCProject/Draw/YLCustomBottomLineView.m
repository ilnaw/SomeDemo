//
//  YLCustomBottomLineView.m
//  TestOCProject
//
//  Created by wl on 2019/4/15.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCustomBottomLineView.h"

@implementation YLCustomBottomLineView

- (void)drawInContext:(CGContextRef)context size:(CGSize)size isCancelled:(BOOL (^)(void))isCancelled
{
    CGContextSetLineWidth(context, 10);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(context, 10, 100);
    CGContextAddLineToPoint(context, [UIScreen mainScreen].bounds.size.width - 20, 100);
    CGContextStrokePath(context);
    
    //lunar
//    CGContextSetFillColorWithColor(context, UIColor.blackColor.CGColor);
//    NSString *lunar = @"初三";
//    [lunar drawInRect:CGRectMake(60, 10, 40, 20) withFont:[UIFont systemFontOfSize:15.0] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    CGContextSetLineWidth(context, 10);
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextSetAlpha(context, 0.6);
//    CGContextFillEllipseInRect(context, CGRectMake(100, 50, 100, 40));
    CGContextAddEllipseInRect(context, CGRectMake(100, 50, 100, 40));
    CGContextFillPath(context);
    CGContextStrokeRect(context, CGRectMake(200, 50, 20, 20));
    
}

@end
