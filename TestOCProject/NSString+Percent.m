//
//  NSString+Percent.m
//  TestOCProject
//
//  Created by zfh on 2019/4/11.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "NSString+Percent.h"

@implementation NSString (Percent)
- (NSString *)toPercent
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [numberFormatter stringFromNumber:@10000];
}
@end
