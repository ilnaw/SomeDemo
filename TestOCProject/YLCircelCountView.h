//
//  YLCircelCountView.h
//  TestOCProject
//
//  Created by wl on 2019/5/7.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLCircelCountView : UIView

+ (instancetype)viewWithCountDown:(NSTimeInterval)countDown;


//开始
- (void)start;

- (void)pasued;
- (void)reStart;

@end



NS_ASSUME_NONNULL_END
