//
//  YLMomentLayout.h
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YLMomentModel;

NS_ASSUME_NONNULL_BEGIN

@interface YLMomentLayout : NSObject

@property (nonatomic, assign)CGFloat padding;
@property (nonatomic, assign)CGSize nameSize;
@property (nonatomic, assign)CGSize  avatarSize;
@property (nonatomic, strong)NSArray *commentCellheightArray;
@property (nonatomic, assign)CGSize textSize;
@property (nonatomic, assign)CGSize contentSize;
@property (nonatomic, assign)CGSize photoSize;
@property (nonatomic, assign)CGSize moreButtonSize;
@property (nonatomic, assign)CGFloat headerHeight;
@property (nonatomic, assign)CGSize timeSize;

+ (instancetype)layoutWithModel:(YLMomentModel *)model;
@end

NS_ASSUME_NONNULL_END
