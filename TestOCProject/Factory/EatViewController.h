//
//  EatViewController.h
//  TestOCProject
//
//  Created by wl on 2019/4/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EatViewController : UIViewController

+ (instancetype)eatWithFoodList:(NSDictionary *)foodList;

@property (nonatomic,strong)NSArray *foods;

- (void)moriningEat;

- (void)moonEat;

- (void)dinnerEat;
@end

NS_ASSUME_NONNULL_END
