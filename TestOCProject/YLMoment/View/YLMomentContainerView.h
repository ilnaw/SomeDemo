//
//  YLMomentContainerView.h
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLMomentModel.h"
#import "YLMomentEvent.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YLMomentContainerDelegate <NSObject>

- (void)catchEvent:(YLMomentEvent *)event;

@end

@interface YLMomentContainerView : UIControl

+ (instancetype)contentWithModel:(YLMomentModel *)model;

@property (nonatomic, weak)id<YLMomentContainerDelegate> delegate;

@property (nonatomic, strong)YLMomentModel *model;

- (void)configUI;

- (void)refreshData:(YLMomentModel *)model;
@end

NS_ASSUME_NONNULL_END
