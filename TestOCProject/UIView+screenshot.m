//
//  UIView+screenshot.m
//  TestOCProject
//
//  Created by wanli on 2019/3/27.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "UIView+screenshot.h"

@implementation UIView (screenshot)
- (UIImage *)screenShot{
    UIImage *imageRet = [[UIImage alloc]init];
    UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageRet;
}

- (UIImage *)screenShotRect:(CGRect)rect
{
    UIImage *image = [self screenShot];
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}
@end
