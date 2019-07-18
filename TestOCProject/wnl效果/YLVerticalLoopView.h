//
//  YLVerticalLoopView.h
//  TestOCProject
//
//  Created by wl on 2019/7/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLVerticalLoopView;
NS_ASSUME_NONNULL_BEGIN

@protocol YLVerticalLoopViewDataSource <NSObject>

- (UIView *)ylVerticalLoopView:(YLVerticalLoopView *)loopView viewAtIndex:(NSInteger)index;

- (NSInteger )ylVerticalLoopViewNumberOfViews;

@end

@interface YLVerticalLoopView : UIView
@property (nonatomic, assign)NSTimeInterval timeInterval;
@property (nonatomic, weak)id<YLVerticalLoopViewDataSource> dataSource;

- (void)startTimer;
- (void)stopTimer;
@end

NS_ASSUME_NONNULL_END
