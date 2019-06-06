//
//  YLIMKeyborad.h
//  TestOCProject
//
//  Created by wl on 2019/6/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLIMToolBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLIMKeyborad : UIView
@property (nonatomic, strong)YLIMToolBar *toolBar;
//取消所有的第一响应
- (void)resignFirstResponder;
//是否为第一响应者
- (BOOL)isFirstResponder;
@end

NS_ASSUME_NONNULL_END
