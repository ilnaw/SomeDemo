//
//  UIButton+YLButtonLayoutType.h
//  TestOCProject
//
//  Created by wl on 2019/5/14.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YLButtonLayoutType) {
    YLButtonLayoutTypeNormal=0,
    YLButtonLayoutTypeImageRight,
    YLButtonLayoutTypeImageTop,
    YLButtonLayoutTypeImageBottom
};

@interface UIButton (YLButtonLayoutType)

- (void)yl_setButtonLayoutType:(YLButtonLayoutType)layoutType;

- (void)yl_setButtonLayoutType:(YLButtonLayoutType)layoutType padding:(CGFloat)padding;

@end

NS_ASSUME_NONNULL_END
