//
//  YLDottedLine.h
//  TestOCProject
//
//  Created by wl on 2019/7/18.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLDottedLine : UIView
/** 线宽 */
@property (nonatomic, assign)CGFloat lineWidth;
/** 虚线长度 */
@property (nonatomic, assign)CGFloat dotWidth;
@property (nonatomic, strong)UIColor *lineColor;
@property (nonatomic, assign)BOOL round;
@property (nonatomic, assign)BOOL horizontal;
@end

NS_ASSUME_NONNULL_END
