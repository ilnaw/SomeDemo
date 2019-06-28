//
//  UITableViewCell+reuse.m
//  TestOCProject
//
//  Created by wanli on 2019/3/18.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "UITableViewCell+reuse.h"

@implementation UITableViewCell (reuse)
+ (NSString *)reuseid
{
    return NSStringFromClass(self.class);
}


@end
