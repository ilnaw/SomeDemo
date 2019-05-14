//
//  YLPopoverController.h
//  CalendarOS7
//
//  Created by wl on 2019/5/13.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLPopoverAction.h"

typedef NS_ENUM(NSInteger, YLPopoverControllerStyle) {
    YLPopoverControllerStyleLight,
    YLPopoverControllerStyleDark
};

@interface YLPopoverController : NSObject
+ (instancetype)popoverControllerWithPreferredStyle:(YLPopoverControllerStyle)preferredStyle;

- (void)addAction:(YLPopoverAction *)action;

- (void)showToView:(UIView *)view;
@end

