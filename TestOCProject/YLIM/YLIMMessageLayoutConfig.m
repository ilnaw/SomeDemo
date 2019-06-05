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
    }else{
        return UIEdgeInsetsZero;
    }
}

- (CGSize)bubbleViewSize
{
    CGSize size = [self.bubbleSizeCache[@"size"] CGSizeValue];
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        if (self.model.messageType == YLMessageTypeText) {
            size = CGSizeMake(200, 100);
        }else if(self.model.messageType == YLMessageTypeImage){
            size = CGSizeMake(150, 300);
        }else{
            size = CGSizeMake(200, 200);
        }
        [self.bubbleSizeCache setObject:[NSValue valueWithCGSize:size] forKey:@"size"];
    }
    return size;
}

- (CGFloat)cellHeight {
    return self.bubbleViewInsets.top + self.bubbleViewInsets.bottom + self.bubbleViewSize.height + self.bubbleViewOutInsets.top + self.bubbleViewOutInsets.bottom;
}
@end
