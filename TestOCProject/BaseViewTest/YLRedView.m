//
//  YLRedView.m
//  TestOCProject
//
//  Created by wl on 2019/5/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLRedView.h"

@interface YLRedView()
@property (nonatomic, strong)UILabel *label;
@end

@implementation YLRedView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.containerView = [[UIView alloc]init];
        self.containerView.backgroundColor = [UIColor redColor];
        [self addSubview:self.containerView];
        
        UILabel *label = [UILabel new];
        label.text = @"123";
        [self.containerView addSubview:label];
        self.label = label;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.containerView.frame = CGRectMake(5, 5, width - 10, height - 10);
    
    self.label.frame = CGRectMake(5, 5, width - 10, height - 20);
}

- (void)LogPosid{
    NSLog(@"----%@",self.posid);
}

- (void)updateUI
{
    NSLog(@"===============%@%@",self,self.posid);
}

@end
