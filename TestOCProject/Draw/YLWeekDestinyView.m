//
//  YLWeekDestinyView.m
//  TestOCProject
//
//  Created by wl on 2019/5/7.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLWeekDestinyView.h"
#import "NSArray+Blocks.h"

@interface YLWeekDestinyView()
@property (nonatomic, strong)NSMutableArray *circleButtons;
@property (nonatomic, strong)UILabel *scoreLabel;
@property (nonatomic, strong)CAGradientLayer *maskLayer;
@property (nonatomic, strong)CALayer *lineLayer;
@end

@implementation YLWeekDestinyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentMode = UIViewContentModeTop;
    }
    return self;
}

- (UILabel *)scoreLabel
{
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc]init];
        _scoreLabel.textColor = [UIColor whiteColor];
        _scoreLabel.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        _scoreLabel.textAlignment = NSTextAlignmentCenter;
        CGRect frame = _scoreLabel.frame;
        frame.size = CGSizeMake(40, 20);
        _scoreLabel.frame = frame;
        _scoreLabel.layer.cornerRadius = 10;
        _scoreLabel.layer.masksToBounds = YES;
    }
    return _scoreLabel;
}

- (NSMutableArray *)circleButtons
{
    if (!_circleButtons) {
        _circleButtons = @[].mutableCopy;
    }
    return _circleButtons;
}

- (void)drawRect:(CGRect)rect
{
    [self drawBg:rect];
    [self drawContent:rect];
}

- (void)drawBg:(CGRect)rect
{
    //draw bg
    CGFloat topMargin = 10;
    CGFloat bottomMargin = 40;
    CGFloat lineWidth = 0.5;
    CGFloat lineLeading = 40;
    CGFloat lineTrailing = 15;
    CGFloat lineSpacing = (CGRectGetHeight(rect) - topMargin - bottomMargin - lineWidth)/5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *vDescription = @[@"大吉",@"小吉",@"平淡",@"低迷",@"小凶"];
    CGColorRef lineColor = [UIColor colorWithRed:255/255.0 green:207/255.0 blue:77/255.0 alpha:0.5].CGColor;
    CGColorRef deepLineColor = [UIColor colorWithRed:249/255.0 green:185/255.0 blue:14/255.0 alpha:1].CGColor;
    
    for (int i = 0; i < 6; i++) {
        //h line
        if (i < 5) {
            CGContextSetStrokeColorWithColor(context, lineColor);
            CGContextSetLineWidth(context, lineWidth);
        }
        else
        {
            CGContextSetStrokeColorWithColor(context, deepLineColor);
            CGContextSetLineWidth(context, 1.f);
        }
        CGContextMoveToPoint(context, lineLeading, i*lineSpacing + topMargin + lineWidth);
        CGContextAddLineToPoint(context, CGRectGetWidth(rect) - lineTrailing, i*lineSpacing + topMargin + lineWidth);
        CGContextStrokePath(context);
        
        if (i == 5) {
            break;
        }
        
        //h description
        UIFont *font = nil;
        if (i==0 || i ==0) {
            font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        }else{
            font = [UIFont systemFontOfSize:15];
        }
        UIColor *textColor;
        if (i == 0 || i == 1){
            textColor = [UIColor colorWithRed:245/255.0 green:185/255.0 blue:14/255.0 alpha:1];
        }else{
            textColor = [UIColor colorWithRed:199/255.0 green:199/255.0 blue:199/255.0 alpha:1];
        }
        NSString *vDesc = vDescription[i];
        [vDesc drawAtPoint:CGPointMake(lineLeading/2.0 - 10, i * lineSpacing + (lineSpacing - 14)/2.0 + topMargin)
            withAttributes:@{
                             NSFontAttributeName : font,
                             NSForegroundColorAttributeName : textColor
                             }];
        
    }
    
    //days
    NSArray *days = @[@"周一",@"周二",@"今天",@"周四",@"周五",@"周六",@"周日"];
    CGFloat vlinePadding = 10;
    CGFloat vLineSpacing = (CGRectGetWidth(rect) - lineLeading - lineTrailing - vlinePadding * 2 - lineWidth/2)/(days.count - 1);
    NSInteger todayIndex = 2;
    
    for (int i = 0; i < days.count; i ++) {
        //v line
        CGContextSetStrokeColorWithColor(context, lineColor);
        CGContextSetLineWidth(context, lineWidth);
        if (i == todayIndex) {
            CGContextSetLineWidth(context, 1);
            CGContextSetStrokeColorWithColor(context, deepLineColor);
        }
        CGFloat originX = lineLeading + vlinePadding + vLineSpacing * i + lineWidth;
        CGContextMoveToPoint(context, originX, topMargin);
        CGContextAddLineToPoint(context, originX, CGRectGetHeight(rect) - bottomMargin);
        CGContextStrokePath(context);
        
        //h desc
        UIFont *font = [UIFont systemFontOfSize:14];
        UIColor *textColor = [UIColor colorWithRed:199/255.0 green:199/255.0 blue:199/255.0 alpha:1];
        if (i == todayIndex) {
            textColor = [UIColor colorWithRed:245/255.0 green:185/255.0 blue:14/255.0 alpha:1];
        }
        NSString *desc = days[i];
        [desc drawAtPoint:CGPointMake(originX - 15, CGRectGetHeight(rect) - bottomMargin + 15)
           withAttributes:@{
                            NSFontAttributeName : font,
                            NSForegroundColorAttributeName : textColor
                            }];
        
    }
}

- (void)drawContent:(CGRect)rect{
    if (self.circleButtons.count) {
        [self.circleButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.circleButtons removeAllObjects];
    }
    if (self.scoreLabel) {
        [self.scoreLabel removeFromSuperview];
    }
    if (self.maskLayer) {
        [self.maskLayer removeFromSuperlayer];
    }
    if (self.lineLayer) {
        [self.lineLayer removeFromSuperlayer];
    }
    
    CGFloat topMargin = 10;
    CGFloat bottomMargin = 40;
    CGFloat leading = 40;
    CGFloat trailing = 15;
    CGFloat lineWidth = 1;
    CGFloat padding = 10;
    CGFloat shapePadding = 5;
    CGFloat pointSpacing = (CGRectGetWidth(rect) - leading - trailing - padding * 2 - lineWidth/2)/(self.scores.count - 1);
//    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *lineColor = [UIColor colorWithRed:209/255.0 green:209/255.0 blue:209/255.0 alpha:1];
    UIColor *deepLineColor = [UIColor colorWithRed:249/255.0 green:185/255.0 blue:14/255.0 alpha:1];
    
    //translate points
    NSMutableArray *points = @[].mutableCopy;
    [self.scores enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat x = leading + padding + lineWidth/2 + pointSpacing * idx;
        CGFloat y = (CGRectGetHeight(rect) - topMargin - bottomMargin) * (1- [obj floatValue]/100.0) + topMargin;
        [points addObject:@{@"x":@(x),@"y":@(y)}];
    }];
    
//    CGContextSetLineWidth(context, lineWidth);
//    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
//    CGContextMoveToPoint(context, [points.firstObject[@"x"] floatValue], [points.firstObject[@"y"] floatValue]);

    //  buttons and lines  shapeLayer
    UIBezierPath *gradientLayerPath = [UIBezierPath new];
    UIBezierPath *linePath = [UIBezierPath new];
    
    //first Button
    UIButton *button = [self creatButtonWithBorderColor:lineColor];
    [self addSubview:button];
    [self.circleButtons addObject:button];
    CGPoint firstPoint = CGPointMake([points.firstObject[@"x"] floatValue], [points.firstObject[@"y"] floatValue]);
    button.center = firstPoint;
    //path
    [gradientLayerPath moveToPoint:CGPointMake(firstPoint.x, firstPoint.y + shapePadding)];
    [linePath moveToPoint:CGPointMake(firstPoint.x, firstPoint.y)];
    
    for (int i = 1; i < points.count; i++) {
        NSDictionary *p = points[i];
        CGPoint point = CGPointMake([p[@"x"] floatValue], [p[@"y"] floatValue]);
        //draw line  and  path
        [gradientLayerPath addLineToPoint:CGPointMake(point.x, point.y + shapePadding)];
//        CGContextAddLineToPoint(context, point.x, point.y);
        [linePath addLineToPoint:point];
        
        NSLog(@"--------------y:%.2f   pathY:%.2f",point.y, point.y + shapePadding);
        
        UIButton *button = [self creatButtonWithBorderColor: i == 2 ? deepLineColor : lineColor];
        button.center = point;
        [self addSubview:button];
        [self.circleButtons addObject:button];
        
        if (i == 2) {
            [self addSubview:self.scoreLabel];
            self.scoreLabel.text = [NSString stringWithFormat:@"%ld", [self.scores[i] integerValue]];
            CGFloat scoreY = point.y + 20;
            if (point.y > CGRectGetHeight(rect) - bottomMargin - 40) {
                scoreY = point.y - 20;
            }
            self.scoreLabel.center = CGPointMake(point.x, scoreY);
        }
    }
//    CGContextStrokePath(context);
    [gradientLayerPath addLineToPoint:CGPointMake([points.lastObject[@"x"] floatValue], CGRectGetHeight(rect) - bottomMargin)];
    [gradientLayerPath addLineToPoint:CGPointMake(firstPoint.x, CGRectGetHeight(rect) - bottomMargin)];
    
    //drawLine
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = lineColor.CGColor;
    lineLayer.lineWidth = lineWidth;
    lineLayer.path = linePath.CGPath;
    lineLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:lineLayer];
    self.lineLayer = lineLayer;
    
    //CAGradientLayer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:207/255.0 blue:77/255.0 alpha:0.5].CGColor,
                     (__bridge id)[UIColor  colorWithRed:255/255.0 green:207/255.0 blue:77/255.0 alpha:0.0].CGColor];
    gradientLayer.startPoint = CGPointMake(0.f, 0.f);
    gradientLayer.endPoint = CGPointMake(0.f, 1.f);
    gradientLayer.frame = self.bounds;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = gradientLayerPath.CGPath;
    gradientLayer.mask = shapeLayer;
    
    self.maskLayer = gradientLayer;
    [self.layer addSublayer:gradientLayer];
    NSLog(@"-----%@",gradientLayerPath);
    //animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.duration = 2;
    animation.fillMode = kCAFillModeForwards;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.removedOnCompletion = NO;
    
    CABasicAnimation *gradientAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    gradientAnimation.fromValue = @(0);
    gradientAnimation.toValue = @(1);
    gradientAnimation.duration = 2;
    gradientAnimation.fillMode = kCAFillModeForwards;
//    gradientAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    gradientAnimation.removedOnCompletion = NO;
    
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.duration = 2;
//    group.fillMode = kCAFillModeForwards;
//    group.removedOnCompletion = NO;
//    group.animations = @[animation,gradientAnimation];
    
    [self.lineLayer addAnimation:animation forKey:@"lineStroke"];
    [self.maskLayer addAnimation:gradientAnimation forKey:@"gradientStroke"];
    
    [self bringSubviewToFront:self.scoreLabel];
}

- (UIButton *)creatButtonWithBorderColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 4;
    CGRect frame = button.frame;
    frame.size = CGSizeMake(8, 8);
    button.frame = frame;
    button.layer.borderWidth = 2;
    button.layer.borderColor = color.CGColor;
    return button;
}

@end
