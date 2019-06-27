//
//  YLMomentPhotosView.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentPhotosView.h"

@interface YLMomentPhotosView()
/** 图片容器 */
@property (nonatomic, strong)NSMutableArray<UIImageView *> *imageViews;
@property (nonatomic, strong)NSArray *photos;
@end

@implementation YLMomentPhotosView

- (instancetype)init
{
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (void)configUI
{
    [super configUI];
    //初始化全部 避免动态加载
    self.imageViews = @[].mutableCopy;
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = UIImageView.new;
        imageView.hidden = NO;
        [self addSubview:imageView];
        [self.imageViews addObject:imageView];
        
        //tapgesture
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    NSInteger count = self.photos.count;
    CGSize photoSize = self.model.layout.photoSize;
    
    for (int i = 0; i < 9; i ++) {
        UIImageView *imageView = self.imageViews[i];
        if (i >= count) {
            imageView.hidden = YES;
        }else{
            imageView.hidden = NO;
            switch (count) {
                case 1:
                    imageView.frame = CGRectMake(0, 0, photoSize.width, photoSize.height);
                    break;
                case 4:
                {
                    CGFloat x = i % 2 * photoSize.width + i % 2 * padding;
                    CGFloat y = i / 2 * photoSize.height + i / 2 * padding;
                    imageView.frame = CGRectMake(x, y, photoSize.width, photoSize.height);
                    break;
                }
                default:
                {
                    CGFloat x = i % 3 * photoSize.width + i % 3 * padding;
                    CGFloat y = i / 3 * photoSize.height + i / 3 * padding;
                    imageView.frame = CGRectMake(x, y, photoSize.width, photoSize.height);
                    break;
                }
            }
        }
    }
}

- (void)refreshData:(YLMomentModel *)model
{
    self.model = model;
    self.photos = self.model.photos;
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    for (int i = 0; i < photos.count; i++) {
        UIImageView *imageView = self.imageViews[i];
        imageView.image = photos[i];
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
