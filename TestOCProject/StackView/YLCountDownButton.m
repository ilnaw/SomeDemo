//
//  YLCountButton.m
//  TestOCProject
//
//  Created by wl on 2019/7/19.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCountDownButton.h"

@interface YLCountDownButton()
@property (nonatomic, strong)CADisplayLink *timer;
@property (nonatomic, assign)CFTimeInterval beginTime;
@property (nonatomic, strong)NSString *defaultTitle;
@property (nonatomic, assign)NSTimeInterval time;
@end

@implementation YLCountDownButton

+ (instancetype)buttonWithTime:(NSTimeInterval)time defaultTitle:(NSString *)title
{
    YLCountDownButton *button = [YLCountDownButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [button setTitle:title forState:UIControlStateNormal];
    button.defaultTitle = title;
    button.time = time;
    
    return button;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)startTimer
{
    if (!self.timer) {
        if (self.time <= 0) {return;}
        self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(_tick:)];
        self.beginTime = CACurrentMediaTime();
        [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)_tick:(CADisplayLink *)sender{
    NSInteger count = self.time - floor(sender.timestamp - self.beginTime);
    if (count >= 0) {
        self.counting = YES;
        if (self.formatBlock) {
            [self setTitle:self.formatBlock(count) forState:UIControlStateNormal];
        }else{
            [self setTitle:[NSString stringWithFormat:@"%lds",(long)count] forState:UIControlStateNormal];
        }
    }else{
        self.counting = NO;
        [self setTitle:self.defaultTitle forState:UIControlStateNormal];
        [self stopTimer];
    }
    self.enabled = !self.counting;
    self.userInteractionEnabled = !self.counting;
}

@end
