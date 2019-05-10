//
//  YLCustomDrawView.m
//  TestOCProject
//
//  Created by wl on 2019/4/15.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCustomDrawView.h"
#import <YYAsyncLayer/YYAsyncLayer.h>

@interface YLCustomDrawView()<YYAsyncLayerDelegate>
@property (nonatomic, assign)CGRect buttonRect;
@end

@implementation YLCustomDrawView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

+ (Class)layerClass
{
    return [YYAsyncLayer class];
}

- (void)contentNeedUpdate
{
    [self.layer setNeedsDisplay];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self contentNeedUpdate];
}

- (YYAsyncLayerDisplayTask *)newAsyncDisplayTask
{
    YYAsyncLayerDisplayTask *task = [YYAsyncLayerDisplayTask new];
    __weak typeof(self) weakSelf = self;
    task.display = ^(CGContextRef  _Nonnull context, CGSize size, BOOL (^ _Nonnull isCancelled)(void)) {
        if(isCancelled()) return;
        
     
        
        //title
        NSString *name = @"万里";
        NSDictionary *attribute = @{
                                    NSFontAttributeName : [UIFont systemFontOfSize:30],
                                    NSForegroundColorAttributeName : [UIColor darkGrayColor]
                                    };
        [name drawAtPoint:CGPointMake(10, 10) withAttributes:attribute];
        
        //lunar
        CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
        CGRect borderRect = CGRectInset(CGRectMake(100, 10, 100, 30), 1, 1);
        UIBezierPath *drawborder = [UIBezierPath bezierPathWithRoundedRect:borderRect cornerRadius:10];
        drawborder.lineWidth = 1;
        [drawborder stroke];
        
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        UIBezierPath *fillRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 10, 100, 30) cornerRadius:10];
        [fillRect fill];
        
        CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
        NSString *lunar = @"初三";
        [lunar drawInRect:CGRectMake(100, 10, 100, 30) withFont:[UIFont systemFontOfSize:20] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
        
        //button
        NSString *buttonName = @"按钮";
        NSDictionary *buttonAttribute = @{
                                          NSFontAttributeName : [UIFont systemFontOfSize:20],
                                          NSForegroundColorAttributeName : [UIColor lightTextColor]
                                          };
        CGSize buttonSize = [buttonName sizeWithAttributes:buttonAttribute];
        self.buttonRect = CGRectMake(10, 50, buttonSize.width, buttonSize.height);
        [buttonName drawInRect:self.buttonRect withAttributes:buttonAttribute];
        
        
        
        //subclass draw
        [weakSelf drawInContext:context
                           size:size
                    isCancelled:isCancelled];
    };
    
    return task;
}

//handle touch
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self];
    
    if (CGRectContainsPoint(self.buttonRect, location)) {
        if([_delegate respondsToSelector:@selector(didSelectedDrawview:index:)]){
            [_delegate didSelectedDrawview:self index:0];
        }
    }
    
//    CGFloat width = MAX(20, 20);
//    CGFloat height = MAX(20, 20);
//    CGRect finalRect = CGRectInset(self.buttonRect, -0.5 * width, -0.5 * height);
//
}

//subclass To implement
- (void)drawInContext:(CGContextRef)context
                 size:(CGSize)size
           isCancelled:(BOOL (^)(void))isCancelled
{
    
}

@end
