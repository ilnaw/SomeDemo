//
//  UIView+DotBadge.m
//  TestOCProject
//
//  Created by wl on 2019/5/31.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "UIView+DotBadge.h"

static CGFloat const kDotDiameter = 6.f;
static CGFloat const kImageDotDiameter = 15.f;

@implementation UIView (DotBadge)

- (UIImageView *)dotBadge{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDotBadge:(UIImageView *)dotBadge{
    return objc_setAssociatedObject(self, @selector(dotBadge), dotBadge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showDotBadge{
    [self showDotWithCorner:UIRectCornerTopRight
                     offset:CGPointZero
                   imageUrl:nil];
}

- (void)showDotWithCorner:(UIRectCorner)corner offset:(CGPoint)point
{
    [self showDotWithCorner:corner
                     offset:point
                   imageUrl:nil];
    
}

- (void)showDotWithCorner:(UIRectCorner)corner offset:(CGPoint)point imageUrl:(nullable NSString *)imageUrl
{
    if (!self.dotBadge) {
        UIImageView *dot = [UIImageView new];
        [self addSubview:dot];
        self.dotBadge = dot;
    }

    CGFloat dotDiameter = imageUrl.length ? kImageDotDiameter : kDotDiameter;
    if (imageUrl.length) {
        self.dotBadge.backgroundColor = [UIColor clearColor];
        //设置图片
    }else{
        self.dotBadge.backgroundColor = [UIColor redColor];
    }
    
    self.dotBadge.layer.cornerRadius = dotDiameter/2.f;
    self.dotBadge.frame = CGRectMake(0, 0, dotDiameter, dotDiameter);
    
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    CGRect originFrame = self.dotBadge.frame;
    
    if (corner & UIRectCornerTopRight) {
        originFrame.origin = CGPointMake(selfWidth + point.x, 0);
    }else if (corner & UIRectCornerTopLeft){
        originFrame.origin = CGPointMake(0, 0);
    }else if (corner & UIRectCornerBottomRight){
        originFrame.origin = CGPointMake(selfWidth + point.x, selfHeight + point.y);
    }else if (corner & UIRectCornerBottomLeft){
        originFrame.origin = CGPointMake(0, selfHeight + point.y);
    }
    self.dotBadge.frame = originFrame;
}

- (void)clearDotBadge
{
    if (self.dotBadge){
        [self.dotBadge removeFromSuperview];
        self.dotBadge = nil;
    }
}
@end
