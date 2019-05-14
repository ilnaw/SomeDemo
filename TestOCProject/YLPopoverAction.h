//
//  YLPopoverAction.h
//  CalendarOS7
//
//  Created by wl on 2019/5/13.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLPopoverAction : NSObject
+ (instancetype)actionWithImage:(UIImage *)image
                          title:(NSString *)title
                        handler:(void (^)(YLPopoverAction *action))handler;
+ (instancetype)actionTitle:(NSString *)title
                    handler:(void (^)(YLPopoverAction *action))hander;

@property (nonatomic, readonly, strong) UIImage *image;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) void (^handler)(YLPopoverAction *action);
@end
