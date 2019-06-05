//
//  YLIMMessageBubbleView.h
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLIMMessageModel;

NS_ASSUME_NONNULL_BEGIN

@interface YLIMMessageBubbleView : UIView

- (void)refreshData:(YLIMMessageModel *)message;

@end

NS_ASSUME_NONNULL_END
