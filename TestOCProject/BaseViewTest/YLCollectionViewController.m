//
//  YLCollectionViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/3.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCollectionViewController.h"
#import "YLHorizontalPageLayout.h"

@interface YLColltionCell : UICollectionViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@end

@implementation YLColltionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.backgroundColor = [UIColor lightGrayColor];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

@end

@interface YLCollectionViewController ()<UICollectionViewDataSource>

@end

@implementation YLCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    YLHorizontalPageLayout *layout = [[YLHorizontalPageLayout alloc]init];
    layout.rowCount = 5;
    layout.columnCount = 6;
    layout.sectionInset = UIEdgeInsetsZero;
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [collection registerClass:YLColltionCell.class forCellWithReuseIdentifier:@"cell"];
    collection.dataSource = self;
    collection.pagingEnabled = YES;
    collection.backgroundColor = [UIColor whiteColor];
    collection.showsHorizontalScrollIndicator = NO;
    collection.bounces = NO;
    [self.view addSubview:collection];
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
    
    UIView *container = [UIView new];
    container.frame = CGRectMake(100, 100, 30, 100);
    container.backgroundColor = [UIColor redColor];
    [self.view addSubview:container];
    
    UIView *insetView = [UIView new];
    CGRect frame = container.bounds;
    insetView.frame = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(10, 10, 10, 10));
    insetView.backgroundColor = [UIColor blueColor];
    [container addSubview:insetView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  50;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YLColltionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
