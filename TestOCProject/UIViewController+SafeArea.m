//
//  UIViewController+SafeArea.m
//  TestOCProject
//
//  Created by wl on 2019/4/22.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "UIViewController+SafeArea.h"

@implementation UIViewController (SafeArea)
- (UIEdgeInsets)safeArea
{
    if (@available(iOS 11.0, *)) {
        return self.view.safeAreaInsets;
    } else {
        // Fallback on earlier versions
        return UIEdgeInsetsZero;
    }
}
@end
