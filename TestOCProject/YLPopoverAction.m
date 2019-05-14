//
//  YLPopoverAction.m
//  CalendarOS7
//
//  Created by wl on 2019/5/12.
//  Copyright © 2019年 wl. All rights reserved.
//

#import "YLPopoverAction.h"

@implementation YLPopoverAction

+ (instancetype)actionWithImage:(UIImage *)image
                          title:(NSString *)title
                        handler:(void (^)(YLPopoverAction *))handler
{
    YLPopoverAction *action = [[YLPopoverAction alloc] init];
    action->_image = image;
    action->_title = title;
    action->_handler = handler;
    return action;
}

+ (instancetype)actionTitle:(NSString *)title
                    handler:(void (^)(YLPopoverAction *))hander
{
    return [self actionWithImage:nil
                           title:title
                         handler:hander];
}

@end
