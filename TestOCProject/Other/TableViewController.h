//
//  TableViewController.h
//  TestOCProject
//
//  Created by wanli on 2019/3/24.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UIViewController

@end

@interface CustomNavigationBar : UIView
@property (copy, nonatomic)void (^settingBlock)();
@end

NS_ASSUME_NONNULL_END
