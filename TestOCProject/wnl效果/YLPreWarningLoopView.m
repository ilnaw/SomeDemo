//
//  YLPreWarningLoopView.m
//  TestOCProject
//
//  Created by wl on 2019/7/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLPreWarningLoopView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface YLPreWarningCell : UICollectionViewCell
@property (nonatomic, strong)UILabel *warningLabel;
@property (nonatomic, strong)UIView *icon;
@end

@implementation YLPreWarningCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [UIView new];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        self.icon = view;
        
        UILabel *text = [UILabel new];
        [self addSubview:text];
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_right).offset(15);
            make.centerY.equalTo(view);
        }];
        self.warningLabel = text;
    
    }
    return self;
}

@end

@interface YLPreWarningLoopView()<SDCycleScrollViewDelegate>
@property (nonatomic, strong)SDCycleScrollView *cycleView;
@property (nonatomic, strong)UIView *customView;
@end

@implementation YLPreWarningLoopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.customView];
        [self addSubview:self.cycleView];
    }
    return self;
}

- (void)layoutSubviews{
    self.cycleView.frame = CGRectMake(0, 0, self.yl_width - 100, self.yl_height);
    self.customView.frame = CGRectMake(self.yl_width - 100, 0, 100, self.yl_height);
}

- (void)setDatas:(NSArray *)datas
{
    _datas = datas;
    self.cycleView.imageURLStringsGroup = datas;
}

- (void)stop{
    self.cycleView.autoScroll = NO;
}

- (void)start{
    self.cycleView.autoScroll = YES;
}

- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view
{
    return YLPreWarningCell.class;
}
- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view
{
    YLPreWarningCell *cellTemp = (YLPreWarningCell *)cell;
    cellTemp.warningLabel.text = self.datas[index];
    cellTemp.icon.backgroundColor = [UIColor redColor];
}


- (SDCycleScrollView *)cycleView
{
    if (!_cycleView) {
        _cycleView = [[SDCycleScrollView alloc]init];
        _cycleView.delegate = self;
        _cycleView.showPageControl = NO;
        _cycleView.autoScrollTimeInterval = 3;
        _cycleView.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _cycleView;
}
- (UIView *)customView
{
    if (!_customView) {
        _customView = [UIView new];
        _customView.backgroundColor = [UIColor orangeColor];
    }
    return _customView;
}
@end
