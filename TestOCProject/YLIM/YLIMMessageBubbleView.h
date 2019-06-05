//
//  YLIMMessageBubbleView.h
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLIMMessageModel;
@class YLMessageModel;

NS_ASSUME_NONNULL_BEGIN

@protocol YLIMMessageBubbleViewDelegate <NSObject>

- (void)onEvent:(YLMessageModel *)data;

@end

@interface YLIMMessageBubbleView : UIControl

@property (nonatomic, strong)YLIMMessageModel *model;

@property (nonatomic, weak)id<YLIMMessageBubbleViewDelegate> delegate;

+ (instancetype)bubbleViewWithMessage:(YLIMMessageModel *)message;

//自定义界面
- (void)configUI;

//刷新界面
- (void)refreshData:(YLIMMessageModel*)model;


@end

NS_ASSUME_NONNULL_END
