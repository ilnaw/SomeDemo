//
//  DrawView.m
//  TestOCProject
//
//  Created by wl on 2019/4/15.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self drawContent];
}

- (void)drawContent
{
    static dispatch_queue_t queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("drawContent", NULL);
    });
    
    dispatch_async(queue, ^{
        UIImage *image = [self drawContentImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.layer.contents = (__bridge id)image.CGImage;
        });
    });
}

- (UIImage *)drawContentImage
{
    __block CGSize size;
    if ([NSThread isMainThread]) {
        size = self.bounds.size;
    }
    else
    {
        dispatch_sync(dispatch_get_main_queue(), ^{
            size = self.bounds.size;
        });
    }
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    //draw content
    [self drawNameAndAge];
    
    //draw image
    [self drawImage];
    
    //draw bottomLine
    [self drawBottomLine:size];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)drawBottomLine:(CGSize)contextSize
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1/[UIScreen mainScreen].scale);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextMoveToPoint(context, 10, 100);
    CGContextAddLineToPoint(context, contextSize.width - 20, 100);
    CGContextStrokePath(context);
}

- (void)drawImage
{
    UIImage *image = [UIImage imageNamed:@"架构分层 1.png"];
    [image drawInRect:CGRectMake(10, 60, 20, 20)
            blendMode:kCGBlendModeOverlay
                alpha:1.0];
}

- (void)drawNameAndAge
{
    CGFloat originX = 10;
    CGFloat originY = 10;
    CGFloat padding = 12;
    
    NSString *name = @"万里";
    NSMutableDictionary *attribute = @{}.mutableCopy;
    attribute[NSFontAttributeName] = [UIFont systemFontOfSize:30 weight:UIFontWeightHeavy];
    attribute[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    //draw name
    [self drawInPoint:CGPointMake(originX, originY) content:name attributes:attribute];
    CGSize nameSize = [self sizeWithContent:name attributes:attribute];
    
    //draw age
    NSString *age = @"24";
    NSDictionary *ageAttribute = @{
                  NSFontAttributeName : [UIFont systemFontOfSize:12 weight:UIFontWeightMedium],
                  NSForegroundColorAttributeName : [UIColor blueColor]
                  };
    CGSize ageSize = [self sizeWithContent:age attributes:ageAttribute];
    [self drawInPoint:CGPointMake(originX + nameSize.width + padding, originY + ceil(nameSize.height - ageSize.height)) content:age attributes:ageAttribute];
}

- (CGSize)sizeWithContent:(NSString *)content attributes:(NSDictionary *)attributes
{
    return [content sizeWithAttributes:attributes];
}

- (void)drawInPoint:(CGPoint)point content:(NSString *)content attributes:(NSDictionary *)attributes
{
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:content attributes:attributes];
    [str drawAtPoint:point];
}
@end
