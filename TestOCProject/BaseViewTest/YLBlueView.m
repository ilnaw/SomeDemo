//
//  YLBlueView.m
//  TestOCProject
//
//  Created by wl on 2019/5/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLBlueView.h"

@interface YLBlueView()
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation YLBlueView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.containerView = [UIView new];
        self.containerView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.containerView];
        
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"架构分层 1.png"];
        [self.containerView addSubview:imageView];
        self.imageView = imageView;
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.containerView.frame = CGRectMake(10, 10, width - 20, height - 20);
    
    self.imageView.frame = self.containerView.bounds;
}

- (void)LogPosid{
    NSLog(@"----%@",self.posid);
}
@end
