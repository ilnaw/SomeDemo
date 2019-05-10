//
//  UIView+screenshot.h
//  TestOCProject
//
//  Created by wanli on 2019/3/27.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (screenshot)
- (UIImage *)screenShot;
- (UIImage *)screenShotRect:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
