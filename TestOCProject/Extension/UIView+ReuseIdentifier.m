//
//  UIView+ReuseIdentifier.m
//  TestOCProject
//
//  Created by wl on 2019/4/22.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "UIView+ReuseIdentifier.h"

@implementation UIView (ReuseIdentifier)

+ (NSString *)reuseid
{
    return NSStringFromClass(self.class);
}

+ (UINib *)reuseNib
{
    return [UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil];
}
@end
