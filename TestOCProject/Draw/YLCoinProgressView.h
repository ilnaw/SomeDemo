//
//  YLCoinProgressView.h
//  TestOCProject
//
//  Created by wl on 2019/5/14.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLCoinProgressView : UIView
//描述
@property (nonatomic, copy)NSArray *descArrays;

@property (nonatomic, assign)CGFloat progress;
@end

NS_ASSUME_NONNULL_END
