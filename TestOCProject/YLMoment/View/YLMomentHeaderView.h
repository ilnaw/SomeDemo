//
//  YLMomentHeaderView.h
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLMomentMoreView.h"
#import "YLMomentModel.h"
#import "YLMomentContainerView.h"
@class YLMomentHeaderView;

NS_ASSUME_NONNULL_BEGIN

@protocol YLMomentHeaderViewDelegate <NSObject>

- (void)catchEventCell:(YLMomentHeaderView *)header event:(YLMomentEvent *)event;

@end

@interface YLMomentHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong)YLMomentMoreView *moreView;
@property (nonatomic, strong)UIButton *moreButton;
@property (nonatomic, strong)UIImageView *avator;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, strong)YLMomentContainerView *content;
@property (nonatomic, strong)UILabel *timeLabel;

+ (instancetype)initWithTableView:(UITableView *)tableView type:(YLMomentContentType)type;

@property (nonatomic,strong)YLMomentModel  *model;

@property (nonatomic, weak)id<YLMomentHeaderViewDelegate> deleagte;
@end

NS_ASSUME_NONNULL_END
