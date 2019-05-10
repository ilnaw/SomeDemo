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
@property (strong, nonatomic)NSArray <UIViewController*> *vcs;
@property (nonatomic, readonly ,copy) void (^block1)(NSString *name);
@end

NS_ASSUME_NONNULL_END
