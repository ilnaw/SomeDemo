//
//  YLCarouselCollectionLayoutVC.m
//  TestOCProject
//
//  Created by wl on 2019/7/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCarouselCollectionLayoutVC.h"
#import "YLCarouseLayout.h"
@interface YLTestAdCell : UICollectionViewCell
@property (nonatomic,strong)UIView *adContainer;
@property (nonatomic,strong)UIView *adView;
@end

@implementation YLTestAdCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *adContainer = [UIView new];
        [self addSubview:adContainer];
        [adContainer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.adContainer = adContainer;
    }
    return self;
}

- (void)setAdView:(UIView *)adView
{
    if (adView != _adView) {
        if (adView) {
            [_adView removeFromSuperview];
            _adView = adView;
            [self.adContainer addSubview:_adView];
            [_adView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(100, 100));
            }];
        }
    }
}

@end


@interface YLCarouselCollectionLayoutVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UIView *adView;
@end

@implementation YLCarouselCollectionLayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    YLCarouseLayout *layout = YLCarouseLayout.new;
    layout.itemSize = CGSizeMake(300, 400);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.decelerationRate = 0.1;
    [collection registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:UICollectionViewCell.reuseid];
    [collection registerClass:YLTestAdCell.class forCellWithReuseIdentifier:YLTestAdCell.reuseid];
    
    [self.view addSubview:collection];
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIView *adView = [UIView new];
        adView.backgroundColor = [UIColor orangeColor];
        UILabel *content = [UILabel new];
        content.text = @"这是广告";
        [adView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(adView);
        }];
        self.adView = adView;
        self.adView.frame = CGRectMake(0, 0, 100, 100);
        [collection reloadData];
    });
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        YLTestAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YLTestAdCell.reuseid forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        cell.adView = self.adView;
        return cell;
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UICollectionViewCell.reuseid forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
