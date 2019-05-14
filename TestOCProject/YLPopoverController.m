//
//  YLPopoverController.m
//  CalendarOS7
//
//  Created by wl on 2019/5/12.
//  Copyright © 2019年 wl. All rights reserved.
//

#import "YLPopoverController.h"
#import "PopoverView/PopoverView.h"

@interface YLPopoverController ()
@property (assign, nonatomic) PopoverViewStyle style;
@property (strong, nonatomic) NSMutableArray<PopoverAction *> *actions;
@end

@implementation YLPopoverController

- (NSMutableArray<PopoverAction *> *)actions
{
    if (!_actions) {
        _actions = [NSMutableArray array];
    }
    return _actions;
}

+ (instancetype)popoverControllerWithPreferredStyle:(YLPopoverControllerStyle)preferredStyle
{
    YLPopoverController *popoverController = [[YLPopoverController alloc] init];
    popoverController.style = (PopoverViewStyle)preferredStyle;
    return popoverController;
}

- (void)addAction:(YLPopoverAction *)action
{
    [self.actions addObject:[PopoverAction
                             actionWithImage:action.image
                             title:action.title
                             handler:^(PopoverAction *_) {
                                 if (action.handler) action.handler(action);
                             }]];
}

- (void)showToView:(UIView *)view
{
    PopoverView *popover = [PopoverView popoverView];
    popover.style = self.style;
    [popover showToView:view withActions:self.actions];
}

@end
