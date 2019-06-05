//
//  YLIMMessageLayoutConfig.h
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YLMessageModel;

NS_ASSUME_NONNULL_BEGIN

@interface YLIMMessageLayoutConfig : NSObject
//左右显示
@property (nonatomic, readonly)BOOL showLeft;
//是否现实昵称
@property (nonatomic, readonly)BOOL showNickName;
//内容外边距
@property (nonatomic, readonly)UIEdgeInsets bubbleViewOutInsets;
//内容内边距
@property (nonatomic, readonly)UIEdgeInsets bubbleViewInsets;
//内容大小
@property (nonatomic, readonly)CGSize contentSize;
//头像间距
@property (nonatomic, readonly)CGPoint avatarMargin;
//昵称间距
@property (nonatomic, readonly)CGPoint nickNameMargin;
//头像大小
@property (nonatomic, readonly)CGSize avatarSize;
//cell高度
@property (nonatomic, readonly)CGFloat cellHeight;

- (instancetype)initWithMessage:(YLMessageModel *)message;

- (void)clearHeightCache;

@end

NS_ASSUME_NONNULL_END
