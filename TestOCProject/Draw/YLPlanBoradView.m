//
//  YLPlanBoradView.m
//  TestOCProject
//
//  Created by wl on 2019/5/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLPlanBoradView.h"

@interface YLPlanBoradView()
@property (nonatomic, strong)NSMutableArray *paths;
@property (nonatomic, strong)UIBezierPath *onePath;
@end

@implementation YLPlanBoradView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.onePath = [UIBezierPath new];
        self.onePath.lineWidth = 5;
        self.onePath.lineCapStyle = kCGLineCapRound;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.onePath moveToPoint:point];
    [self.paths addObject:self.onePath];
   
    
    [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    UIBezierPath *lastPath = self.onePath;
    [lastPath addLineToPoint:point];
     
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    if (self.paths.count) {
//        [self.paths removeLastObject];
//    }
    [self setNeedsDisplay];
    [self.onePath closePath];
    
    [[[UIColor cyanColor] colorWithAlphaComponent:0.5] setFill];
    [self.onePath fill];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [[UIColor blueColor] setStroke];
    UIBezierPath *lastPath = self.onePath;
    [lastPath stroke];
}

- (NSMutableArray *)paths
{
    if (!_paths) {
        _paths = @[].mutableCopy;
    }
    return _paths;
}

@end
