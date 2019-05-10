//
//  SecondMasonryViewController.h
//  TestOCProject
//
//  Created by wl on 2019/4/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestPropertyProtocol <NSObject>

@property (nonatomic, strong)NSDictionary *configDic;

@end

@interface SecondMasonryViewController : UIViewController<TestPropertyProtocol>
@end

NS_ASSUME_NONNULL_END
