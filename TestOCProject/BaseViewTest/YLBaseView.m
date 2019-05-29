//
//  YLBaseView.m
//  TestOCProject
//
//  Created by wl on 2019/5/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLBaseView.h"
#import "YLRedView.h"
#import "YLBlueView.h"

@implementation YLBaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

+ (instancetype)creatWithInt:(NSInteger)index
{
    YLBaseView *baseView = nil;
    if (index == 0) {
        baseView = [YLBlueView new];
    }else{
        baseView = [YLRedView new];
    }
    return baseView;
}

- (void)updateUI{
    [self LogPosid];
}

- (void)LogPosid{
    
}
@end
