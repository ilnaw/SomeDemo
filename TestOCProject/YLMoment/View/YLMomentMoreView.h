//
//  YLMomentMoreView.h
//  TestOCProject
//
//  Created by wl on 2019/6/26.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLMomentMoreView : UIView
/** 是否展示 */
@property (nonatomic, assign, getter = isShowing)BOOL showing;
/** 点赞点击回调 */
@property (nonatomic, copy)void (^likeClickedCallback)(YLMomentMoreView *view);
/** 评论点击回调 */
@property (nonatomic, copy)void (^commentClickedCallback)(YLMomentMoreView *view);

/**
 展现

 @param animation 动画
 */
- (void)showAnimation:(BOOL)animation;

/**
 隐藏

 @param animation 动画
 */
- (void)hiddenAnimation:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END
