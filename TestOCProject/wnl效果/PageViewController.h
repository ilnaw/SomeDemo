//
//  PageViewController.h
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageViewController : UIPageViewController
@property (nonatomic, readonly ,copy) void (^block1)(NSString *name);

- (void)setData;

- (void)setScrollViewGestureEnaled:(BOOL)enabled;

@property (assign, nonatomic)BOOL gestureAbled;

- (void)scrollToTop;
@end

NS_ASSUME_NONNULL_END
