//
//  YLPreWarningLoopView.h
//  TestOCProject
//
//  Created by wl on 2019/7/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLPreWarningLoopView : UIView
@property (nonatomic,strong)NSArray  *datas;

- (void)start;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
