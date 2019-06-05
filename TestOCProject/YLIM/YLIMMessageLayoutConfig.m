//
//  YLIMMessageLayoutConfig.m
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageLayoutConfig.h"
#import "YLMessageModel.h"

@interface YLIMMessageLayoutConfig()
@property (nonatomic, strong)YLMessageModel *model;
@property (nonatomic, strong)NSMutableDictionary *bubbleSizeCache;
@end

@implementation YLIMMessageLayoutConfig

- (instancetype)initWithMessage:(YLMessageModel *)message{
    self = [super init];
    if (self) {
        self.model = message;
        self.bubbleSizeCache = @{}.mutableCopy;
    }
    return self;
}

- (BOOL)showLeft
{
    return self.model.left;
}

- (BOOL)showNickName {
    return self.model.group;
}

- (CGPoint)nickNameMargin
{
    return CGPointMake(8.f, 0.f);
}

- (CGPoint)avatarMargin
{
    return CGPointMake(8.f, 0.f);
}

- (CGSize)avatarSize
{
    return CGSizeMake(40, 40);
}

- (UIEdgeInsets)bubbleViewOutInsets
{
    CGFloat cellTopToBubbleTop = 8.f;
    CGFloat nickNameHeight = 20.f;
    CGFloat bubbleOriginX = 55.f;
    CGFloat cellBubbleButtomToCellButtom = 8.f;
    if (self.showNickName) {
        return UIEdgeInsetsMake(cellTopToBubbleTop + nickNameHeight, bubbleOriginX, cellBubbleButtomToCellButtom, 0);
    }else{
        return UIEdgeInsetsMake(cellTopToBubbleTop, bubbleOriginX, cellBubbleButtomToCellButtom, 0);
    }
}

- (UIEdgeInsets)bubbleViewInsets
{
    if (self.model.messageType == YLMessageTypeText) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }else if (self.model.messageType == YLMessageTypeImage){
        return UIEdgeInsetsMake(5, 5, 5, 5);
    }else if(self.model.messageType == YLMessageTypeAnswer){
        return UIEdgeInsetsMake(1, 1, 1, 1);
    }else{
        return UIEdgeInsetsZero;
    }
}

- (CGSize)contentSize
{
    CGSize size = [self.bubbleSizeCache[@"size"] CGSizeValue];
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        if (self.model.messageType == YLMessageTypeText) {
            size = [self _calculateTextSize];
        }else if(self.model.messageType == YLMessageTypeImage){
            size = [self _calculateImageSize];
        }else if(self.model.messageType == YLMessageTypeRedPacket){
            size = CGSizeMake(180, 100);
        }else{
            size = CGSizeMake(200, 400);
        }
        [self.bubbleSizeCache setObject:[NSValue valueWithCGSize:size] forKey:@"size"];
    }
    return size;
}

- (CGFloat)cellHeight {
    return self.bubbleViewInsets.top + self.bubbleViewInsets.bottom + self.contentSize.height + self.bubbleViewOutInsets.top + self.bubbleViewOutInsets.bottom;
}

- (CGSize)_calculateTextSize{
    CGFloat maxWidth = UIScreen.mainScreen.bounds.size.width - 150;
    CGSize maxSize = [self.model.content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.f]}
                                     context:nil].size;
    if (ceilf(maxSize.width) > maxWidth) {
       CGFloat height = [self.model.content boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                         options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.f]}
                                         context:nil].size.height;
        return CGSizeMake(maxWidth, height);
    }else{
        return maxSize;
    }
}

- (CGSize)_calculateImageSize{
    CGFloat maxWidth = UIScreen.mainScreen.bounds.size.width - 180;
    CGFloat maxHeight = maxWidth;
    CGFloat minWidth = 120;
    CGFloat minHeight = 120;
    UIImage *image = [UIImage imageNamed:self.model.url];

    return [self _sizeWithImageOriginSize:image.size
                                  minSize:CGSizeMake(minWidth, minHeight)
                                  maxSize:CGSizeMake(maxWidth, maxHeight)];
}

//按比例固定图片大小
- (CGSize)_sizeWithImageOriginSize:(CGSize)originSize
                              minSize:(CGSize)imageMinSize
                              maxSize:(CGSize)imageMaxSiz{
    CGSize size;
    NSInteger imageWidth = originSize.width ,imageHeight = originSize.height;
    NSInteger imageMinWidth = imageMinSize.width, imageMinHeight = imageMinSize.height;
    NSInteger imageMaxWidth = imageMaxSiz.width,  imageMaxHeight = imageMaxSiz.height;
    if (imageWidth > imageHeight) //宽图
    {
        size.height = imageMinHeight;  //高度取最小高度
        size.width = imageWidth * imageMinHeight / imageHeight;
        if (size.width > imageMaxWidth)
        {
            size.width = imageMaxWidth;
        }
    }
    else if(imageWidth < imageHeight)//高图
    {
        size.width = imageMinWidth;
        size.height = imageHeight *imageMinWidth / imageWidth;
        if (size.height > imageMaxHeight)
        {
            size.height = imageMaxHeight;
        }
    }
    else//方图
    {
        if (imageWidth > imageMaxWidth)
        {
            size.width = imageMaxWidth;
            size.height = imageMaxHeight;
        }
        else if(imageWidth > imageMinWidth)
        {
            size.width = imageWidth;
            size.height = imageHeight;
        }
        else
        {
            size.width = imageMinWidth;
            size.height = imageMinHeight;
        }
    }
    return size;
}
@end
