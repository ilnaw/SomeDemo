//
//  ExampleViewController.h
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kUUID;
extern NSString *const kNoSure;
#define ANIMATION_DURATION 0.3

@interface YLExampleViewController : UIViewController
@property(nonatomic, readonly, assign)NSUInteger index;
@end

NS_ASSUME_NONNULL_END
