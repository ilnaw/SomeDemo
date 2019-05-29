//
//  YLCView.m
//  TestOCProject
//
//  Created by wl on 2019/5/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCView.h"
@interface YLCView()
@property (nonatomic, strong)UIView *line;
@end

@implementation YLCView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"YLCView" owner:nil options:nil].firstObject;
        [self configUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        [self configUI];
    }
    return self;
}

- (void)configUI{
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    self.line = line;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.line.frame = CGRectMake(8, self.bounds.size.height - 4, self.bounds.size.width - 16, 4);
}

- (IBAction)buttonAction:(id)sender {
    int i = 5;
    NSAssert1(i > 4, @"i必须大于5", @(824824));
    NSLog(@"--------%@",self.posid);
}

- (void)fuckThisShit{
    
}
@end
