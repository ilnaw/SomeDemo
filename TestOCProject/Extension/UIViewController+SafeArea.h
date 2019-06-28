//
//  UIViewController+SafeArea.h
//  TestOCProject
//
//  Created by wl on 2019/4/22.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SafeArea)
@property (nonatomic, readonly ,assign)UIEdgeInsets safeArea;
@end

NS_ASSUME_NONNULL_END
