//
//  YLCountButton.h
//  TestOCProject
//
//  Created by wl on 2019/7/19.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLCountDownButton : UIButton
+ (instancetype)buttonWithTime:(NSTimeInterval)time defaultTitle:(NSString *)title;
/** 展示回调 */
@property (nonatomic, copy)NSString* (^formatBlock)(NSInteger time);
/** 计时状态 */
@property (nonatomic, assign ,getter=isCounting)BOOL counting;

- (void)startTimer;
- (void)stopTimer;
@end

NS_ASSUME_NONNULL_END
