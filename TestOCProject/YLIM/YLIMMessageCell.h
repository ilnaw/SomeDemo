//
//  YLIMMessageBaseCell.h
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLIMMessageModel.h"
@class YLIMMessageBubbleView;
@class YLMessageModel;

NS_ASSUME_NONNULL_BEGIN

@protocol YLIMMessageDelegate <NSObject>

- (void)onEvent:(YLMessageModel *)data;

@end

@interface YLIMMessageCell : UITableViewCell

/**
 消息内容
 */
@property (nonatomic, strong)YLIMMessageModel  *model;

/**
 头像
 */
@property (nonatomic, strong)UIImageView *avator;

/**
 昵称
 */
@property (nonatomic, strong)UILabel *nameLabel;
//
///**
// 发送消息指示器
// */
//@property (nonatomic, strong)UIActivityIndicatorView *traningActivityIndicator;

/**
 内容
 */
@property (nonatomic, strong)YLIMMessageBubbleView *bubbleView;


@property (nonatomic, weak)id<YLIMMessageDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
