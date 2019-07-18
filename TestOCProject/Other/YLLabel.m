//
//  YLLabel.m
//  TestOCProject
//
//  Created by wl on 2019/7/17.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLLabel.h"

@interface YLLabel()
@property (nonatomic, strong)NSTextStorage *textStorage;
@property (nonatomic, strong)NSTextContainer *textContainer;
@property (nonatomic, strong)NSLayoutManager *layoutManager;
@end

@implementation YLLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textStorage = [NSTextStorage new];
        self.textContainer = [NSTextContainer new];
        self.layoutManager = [NSLayoutManager new];
        
        [self.textStorage addLayoutManager:self.layoutManager];
        [self.layoutManager addTextContainer:self.textContainer];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textContainer.size = self.bounds.size;
}

- (void)setText:(NSString *)text
{
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName : self.font}];
    [self.textStorage setAttributedString:attr];
    
    [self setNeedsDisplay];
}

- (void)drawTextInRect:(CGRect)rect {
    [self.layoutManager drawGlyphsForGlyphRange:NSMakeRange(0, self.textStorage.length) atPoint:CGPointZero];
}

//- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
//{
//    return [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
//}
//
//- (CGSize)intrinsicContentSize
//{
//    CGSize size = [super intrinsicContentSize];
//    return size;
//}
@end
