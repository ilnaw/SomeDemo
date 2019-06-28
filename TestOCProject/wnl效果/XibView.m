//
//  XibView.m
//  TestOCProject
//
//  Created by zfh on 2019/4/10.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "XibView.h"

@implementation XibView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor lightGrayColor];
    [self configUI];
}

- (void)configUI{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    label.textColor = [UIColor redColor];
    label.text = @"12312312312";
    [self addSubview:label];
}

@end
