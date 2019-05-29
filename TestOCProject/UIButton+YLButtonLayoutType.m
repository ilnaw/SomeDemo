//
//  UIButton+YLButtonLayoutType.m
//  TestOCProject
//
//  Created by wl on 2019/5/14.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "UIButton+YLButtonLayoutType.h"

@implementation UIButton (YLButtonLayoutType)
- (void)yl_setButtonLayoutType:(YLButtonLayoutType)layoutType
{
    [self yl_setButtonLayoutType:layoutType padding:0];
}

- (void)yl_setButtonLayoutType:(YLButtonLayoutType)layoutType padding:(CGFloat)padding
{
    CGFloat image_w = self.imageView.bounds.size.width;
    CGFloat image_h = self.imageView.bounds.size.height;
    
    CGFloat title_w = self.titleLabel.bounds.size.width;
    CGFloat title_h = self.titleLabel.bounds.size.height;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        title_w = self.titleLabel.intrinsicContentSize.width;
        title_h = self.titleLabel.intrinsicContentSize.height;
    }
    
    padding = padding > 0 ? padding : 4;
    
    UIEdgeInsets imageEdge = UIEdgeInsetsZero;
    UIEdgeInsets titleEdge = UIEdgeInsetsZero;
    
    switch (layoutType) {
        case YLButtonLayoutTypeNormal:
        {
            titleEdge = UIEdgeInsetsMake(0, padding, 0, 0);
            imageEdge = UIEdgeInsetsMake(0, 0, 0, padding);
        }
            break;
        case YLButtonLayoutTypeImageRight:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w - padding, 0, image_w);
            imageEdge = UIEdgeInsetsMake(0, title_w + padding, 0, -title_w);
        }
            break;
        case YLButtonLayoutTypeImageTop:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w, -image_h - padding, 0);
            imageEdge = UIEdgeInsetsMake(-title_h - padding, 0, 0, -title_w);
        }
            break;
        case YLButtonLayoutTypeImageBottom:
        {
            titleEdge = UIEdgeInsetsMake(-image_h - padding, -image_w, 0, 0);
            imageEdge = UIEdgeInsetsMake(0, 0, -title_h - padding, -title_w);
        }
            break;
        default:
            break;
    }
    self.imageEdgeInsets = imageEdge;
    self.titleEdgeInsets = titleEdge;
}


@end
