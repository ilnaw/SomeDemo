//
//  YLPopoverView.h
//  TestOCProject
//
//  Created by wl on 2019/5/15.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YLPopoverViewStyle) {
    YLPopoverViewStyleDark,
};

@interface YLPopoverAction : NSObject

@property (nonatomic, readonly, strong)UIImage *icon;
@property (nonatomic, readonly, copy)NSString *title;
@property (nonatomic, readonly, copy)void (^handler)(YLPopoverAction *action);

+ (instancetype)actionWithTitle:(NSString *)title
                           icon:(nullable UIImage *)icon
                  actionHandler:(void (^)(YLPopoverAction *action))handler;

+ (instancetype)actionWithTitle:(NSString *)title
                  actionHandler:(void (^)(YLPopoverAction *action))handler;

@end



@interface YLPopoverView : UIView

+ (instancetype)popoverWithPreferredStyle:(YLPopoverViewStyle)popoverStyle;

- (void)addAction:(YLPopoverAction *)action;

- (void)showToView:(UIView *)view;

- (void)showToPoint:(CGPoint )point;

@end

NS_ASSUME_NONNULL_END
