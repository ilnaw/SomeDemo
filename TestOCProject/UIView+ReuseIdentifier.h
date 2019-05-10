//
//  UIView+ReuseIdentifier.h
//  TestOCProject
//
//  Created by wl on 2019/4/22.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ReuseIdentifier)

@property (nonatomic, readonly, class, copy) NSString *reuseid;

@property (nonatomic, readonly, class, strong) UINib *reuseNib;

@end

NS_ASSUME_NONNULL_END
