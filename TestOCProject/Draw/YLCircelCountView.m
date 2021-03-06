//
//  YLCircelCountView.m
//  TestOCProject
//
//  Created by wl on 2019/5/7.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCircelCountView.h"

@interface YLCircelCountView()
//倒计时 时间
@property (nonatomic, assign)NSTimeInterval countDown;
@property (nonatomic, strong)CADisplayLink *timer;
@property (nonatomic, assign)CFTimeInterval beginTime;
@property (nonatomic, assign)CFTimeInterval pasuedBeforeTimef;
@property (nonatomic, assign)CFTimeInterval percent;
@property (nonatomic, strong)UILabel *countDownLabel;
@end

@implementation YLCircelCountView

+ (instancetype)viewWithCountDown:(NSTimeInterval)countDown
{
    YLCircelCountView *view = [[YLCircelCountView alloc]init];
    view.countDown = countDown;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.percent = 0;
        UILabel *label = [UILabel new];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        _countDownLabel = label;
        

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGFloat x = rect.size.width/2.0;
    CGFloat y = rect.size.height/2.0;
    CGFloat radius = (x > y ? y : x) - 10;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 6);
    //gray
    CGContextSetStrokeColorWithColor(context, UIColor.grayColor.CGColor);
    CGContextAddArc(context, x, y, radius, 0, 2*M_PI, 0);
    CGContextStrokePath(context);
    
    //red
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextAddArc(context, x, y, radius, 0, self.percent/self.countDown * 2 * M_PI, 0);
    
    CGContextStrokePath(context);
}


//使用shaperlayer 这种背景和进度最好都用shaperlayer。不断改变shaperlayer的strokenEnd
- (void)layoutSubviews{
    //draw backgroud
    CGRect frame = self.frame;
    CGFloat x = frame.size.width/2.0;
    CGFloat y = frame.size.height/2.0;
    CGFloat radius = (x > y ? y : x) - 10;
    
    UIBezierPath *path = [UIBezierPath new];
    [path addArcWithCenter:CGPointMake(x,y) radius:radius startAngle:0 endAngle:2*M_PI clockwise:0];
    
    CAShapeLayer *bottomLayer = [CAShapeLayer new];
    bottomLayer.path = path.CGPath;
    bottomLayer.strokeColor = UIColor.grayColor.CGColor;
    bottomLayer.lineWidth = 5;
    bottomLayer.strokeEnd = 0.8;
    
    [self.layer insertSublayer:bottomLayer atIndex:0];
}


- (void)start
{
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(ticker:)];
    self.beginTime = CACurrentMediaTime();
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)pasued{
    self.pasuedBeforeTimef = CACurrentMediaTime();
    [self.timer setPaused:true];
}

- (void)reStart{
    CFTimeInterval pasuedTimef = CACurrentMediaTime() - self.pasuedBeforeTimef;
    self.beginTime += pasuedTimef;
    [self.timer setPaused:false];
}

- (void)ticker:(CADisplayLink *)sender{
    self.percent = sender.timestamp - self.beginTime;
    
    NSInteger count = self.countDown - floor(sender.timestamp - self.beginTime);
    self.countDownLabel.text = [NSString stringWithFormat:@"%ld",(long)count];
    
    if (self.percent >= self.countDown) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self setNeedsDisplay];
}


@end
