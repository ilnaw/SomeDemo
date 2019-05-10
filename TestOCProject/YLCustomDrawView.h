//
//  YLCustomDrawView.h
//  TestOCProject
//
//  Created by wl on 2019/4/15.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class YLCustomDrawView;

@protocol YLCustomDrawViewDelegate <NSObject>

- (void)didSelectedDrawview:(YLCustomDrawView *)view index:(NSInteger)index;

@end

@interface YLCustomDrawView : UIView
//subclass to implement
- (void)drawInContext:(CGContextRef)context
                 size:(CGSize)size
          isCancelled:(BOOL (^)(void))isCancelled;

- (void)contentNeedUpdate;

@property (nonatomic, weak)id<YLCustomDrawViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
