//
//  YLMomentLayout.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentLayout.h"
#import "YLMomentModel.h"

@interface YLMomentLayout()
@property (nonatomic, strong)YLMomentModel *model;
@end

@implementation YLMomentLayout

+ (instancetype)layoutWithModel:(YLMomentModel *)model{
    YLMomentLayout *layout = YLMomentLayout.new;
    layout.model = model;
    return layout;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)setModel:(YLMomentModel *)model
{
    _model = model;
    CGFloat left = self.padding + self.avatarSize.width + self.padding;
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat contentMaxWidth = screenWidth - left - self.padding;
    self.textSize = CGSizeMake(contentMaxWidth, [self _contentHeightWithMaxWidth:contentMaxWidth]);
    
    switch (model.type) {
        case YLMomentContentTypePhotos:
            self.contentSize = [self _photosSizeWithWidth:contentMaxWidth];
            self.photoSize = [self _photoSize];
            break;
        case YLMomentContentTypeShares:
            self.contentSize = CGSizeMake(contentMaxWidth, 60);
            break;
        case YLMomentContentTypeVideos:
            self.contentSize = CGSizeMake(contentMaxWidth, 160);
            break;
        default:
            break;
    }

    NSMutableArray *commentCell = @[].mutableCopy;
    for (NSString *comment in self.model.comments) {
        CGFloat height = [comment boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 100 - 20, MAXFLOAT)
                                               options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.f]}
                                               context:nil].size.height;
        [commentCell addObject:@(ceil(height) + 8)];
    }
    self.commentCellheightArray = [commentCell copy];
    
    CGFloat textHeight = self.padding + self.textSize.height;
    if (self.textSize.height == 0) {
        textHeight = 0;
    }
    
    CGFloat contentHeight = self.padding + self.contentSize.height;
    if (self.contentSize.height == 0) {
        contentHeight = 0;
    }
    
    self.headerHeight = self.padding
    + self.nameSize.height
    + textHeight
    + contentHeight
    + self.padding
    + self.moreButtonSize.height
    + (self.model.comments.count ? self.padding : 0);

}

- (CGSize)_photoSize{
    NSInteger photosCount = self.model.photos.count;
    
    switch (photosCount) {
        case 0:
            return CGSizeZero;
            break;
        case 1:
            return CGSizeMake(120, 160);
            break;
        default:{
            return CGSizeMake(80,80);
        }
            break;
    }
}

- (CGSize)_photosSizeWithWidth:(CGFloat)maxWidth {
    NSInteger photosCount = self.model.photos.count;
    CGSize photoSize = [self _photoSize];
    
    switch (photosCount) {
        case 0:
            return CGSizeZero;
            break;
        case 1:
            return photoSize;
            break;
        case 4:
            return CGSizeMake(maxWidth, photoSize.height * 2 + 10);
            break;
        default:{
            NSInteger line = photosCount / 3 + (photosCount % 3 ? 1 : 0);
            return CGSizeMake(maxWidth, photoSize.height * line + 10 * (line-1));
        }
            break;
    }
}

- (CGFloat)_contentHeightWithMaxWidth:(CGFloat)width{
    if (self.model.content.length == 0) {
        return 0;
    }
    CGFloat height = ceil([self.model.content boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15 weight:UIFontWeightMedium]} context:nil].size.height);
    
    return height;
}

- (CGFloat)padding
{
    return 15.f;
}

- (CGSize)avatarSize{
    return CGSizeMake(70, 70);
}

- (CGSize)moreButtonSize
{
    return CGSizeMake(40, 20);
}

- (CGSize)nameSize
{
    return CGSizeMake(200, 20);
}

- (CGSize)timeSize
{
    return CGSizeMake(100, 20);
}
@end
