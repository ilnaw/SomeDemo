//
//  YLCoinProgressView.m
//  TestOCProject
//
//  Created by wl on 2019/5/14.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCoinProgressView.h"

@interface YLNodeView : UIView
@property (nonatomic, assign)BOOL isSeleted;
@property (nonatomic, strong)UIView *heartView;
@end

@implementation YLNodeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        view.layer.cornerRadius = 1.5;
        view.alpha = 0;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(3, 3));
        }];
        self.heartView = view;
    }
    return self;
}
- (void)setIsSeleted:(BOOL)isSeleted
{
    _isSeleted = isSeleted;
    if (_isSeleted) {
        self.backgroundColor = [UIColor whiteColor];
        self.heartView.alpha = 1;
    }
}
@end

@interface YLCoinProgressView()
@property (nonatomic, strong)CAShapeLayer *shapeLayer;
@property (nonatomic, strong)NSMutableArray<YLNodeView*> *nodeViews;
@end

@implementation YLCoinProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (NSMutableArray<YLNodeView *> *)nodeViews
{
    if (!_nodeViews) {
        _nodeViews = @[].mutableCopy;
    }
    return _nodeViews;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self.nodeViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.nodeViews removeAllObjects];
    
    CGFloat marginLeft = 50;
    CGFloat lineWidth = 5;
    CGFloat pointSpacing = (CGRectGetWidth(rect) - marginLeft * 2)/(self.descArrays.count - 1);
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //draw bottomLine
    CGContextSetStrokeColorWithColor(context, UIColor.lightGrayColor.CGColor);
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);

    CGContextMoveToPoint(context, marginLeft, height/2.0);
    CGContextAddLineToPoint(context, width - marginLeft, height/2.0);
    CGContextStrokePath(context);

    //drawPoint and label
    for (int i = 0; i < self.descArrays.count; i ++) {
        CGFloat x = marginLeft + pointSpacing * i;
        CGFloat y = height / 2.0;
        
        if (i == self.descArrays.count - 1) {
            UIImageView *icon = [UIImageView new];
            icon.image = [UIImage imageNamed:@"v472_task_500_icon"];
            icon.mj_size = CGSizeMake(17, 20);
            icon.center = CGPointMake(x, y);
            [self addSubview:icon];
        }
        else{
            YLNodeView *view = [YLNodeView new];
            view.mj_size = CGSizeMake(14, 14);
            view.layer.cornerRadius = 7;
            view.center = CGPointMake(x, y);
            [self addSubview:view];
            
            if (i == 1) {
                view.isSeleted = YES;
            }
        }

        NSString *str = self.descArrays[i];
        NSDictionary *strAttribute = @{
                                       NSFontAttributeName : [UIFont systemFontOfSize:15],
                                       NSForegroundColorAttributeName : [UIColor lightGrayColor]
                                       };
        CGFloat strWidth = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:strAttribute context:nil].size.width;
        [str drawAtPoint:CGPointMake(x - strWidth / 2.0, y + 10) withAttributes:strAttribute];
    }
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self layoutIfNeeded];
    CGFloat f_progress = MAX(progress, 0);
    f_progress = MIN(f_progress, 1);
    
    [self _animationWithPercent:f_progress];
}

- (void)_animationWithPercent:(CGFloat)percent
{
    [self.shapeLayer removeFromSuperlayer];
    [self.shapeLayer removeAllAnimations];
    self.shapeLayer = nil;
    
    CGFloat marginLeft = 50;
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    CGFloat lineWidth = 5;
    
    //shapeLayer;
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(marginLeft, height/2.0)];
    [path addLineToPoint:CGPointMake(width - marginLeft, height/2.0)];
    
    self.shapeLayer = [CAShapeLayer new];
    self.shapeLayer.path = path.CGPath;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.shapeLayer.lineWidth = lineWidth;
    self.shapeLayer.lineCap = kCALineCapRound;
    [self.layer insertSublayer:self.shapeLayer atIndex:1];
    
    
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.fromValue = @(0);
    strokeAnimation.toValue = @(_progress);
    strokeAnimation.fillMode = kCAFillModeForwards;
    strokeAnimation.removedOnCompletion = NO;
    strokeAnimation.duration = 1;
    strokeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.shapeLayer addAnimation:strokeAnimation forKey:@"s"];
}

@end
