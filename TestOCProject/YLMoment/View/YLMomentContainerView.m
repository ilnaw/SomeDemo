//
//  YLMomentContainerView.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentContainerView.h"
#import "YLMomentPhotosView.h"
#import "YLMomentVideo.h"
#import "YLMomentShare.h"

@implementation YLMomentContainerView

+ (instancetype)contentWithModel:(YLMomentModel *)model
{
    YLMomentContainerView *content = nil;
    switch (model.type) {
        case YLMomentContentTypePhotos:
            content = YLMomentPhotosView.new;
            break;
        case YLMomentContentTypeShares:
            content = YLMomentShare.new;
            break;
        case YLMomentContentTypeVideos:
            content = YLMomentVideo.new;
            break;
        default:
            break;
    }
    content.model = model;
    
    return content;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

//for subclass
- (void)configUI
{
    [self addTarget:self
             action:@selector(containerDidTouchUpInside)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)refreshData:(YLMomentModel *)model
{
   
}

- (void)containerDidTouchUpInside{
    
}
@end
