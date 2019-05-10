//
//  UIView+WXFrame.h
//  WeatherDemo
//
//  Created by youloft on 2016/12/26.
//  Copyright © 2016年 youloft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WXFrame)

@property (nonatomic,assign)CGFloat frameX;
@property (nonatomic,assign)CGFloat frameY;

@property (nonatomic,assign)CGFloat boundsX;
@property (nonatomic,assign)CGFloat boundsY;
@property (nonatomic,assign)CGFloat centerX;
@property (nonatomic,assign)CGFloat centerY;

@property(nonatomic,assign)CGFloat maxX;
@property(nonatomic,assign)CGFloat maxY;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;

@property (nonatomic,assign)CGFloat yl_width;
@property (nonatomic,assign)CGFloat yl_height;
@property (nonatomic,assign)CGSize yl_size;

@end
