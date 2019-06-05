//
//  YLHorizontalPageLayout.m
//  TestOCProject
//
//  Created by wl on 2019/6/3.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLHorizontalPageLayout.h"

@interface YLHorizontalPageLayout()
@property (nonatomic, strong)NSArray<UICollectionViewLayoutAttributes *> *attributes;
@property (nonatomic, assign)NSInteger pageNumber;
@end

@implementation YLHorizontalPageLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}
- (void)prepareLayout
{
    [super prepareLayout];
    NSInteger itemsCount = [self.collectionView numberOfItemsInSection:0];
    NSInteger pageCount = self.columnCount * self.rowCount;
    self.pageNumber = itemsCount/pageCount + (itemsCount % pageCount ? 1 : 0);
    
    CGFloat left = self.sectionInset.left;
    CGFloat top = self.sectionInset.top;
    CGFloat right = self.sectionInset.right;
    CGFloat bottom = self.sectionInset.bottom;
    CGFloat lineSpacing = self.minimumLineSpacing;
    CGFloat itemSpacing = self.minimumInteritemSpacing;
    
    CGFloat collectionWidth = CGRectGetWidth(self.collectionView.frame);
    CGFloat collectionHeight = CGRectGetHeight(self.collectionView.frame);
    
    CGFloat cellWidth = (collectionWidth - left - right - (self.columnCount - 1)*itemSpacing)/(self.columnCount * 1.f);
    CGFloat cellHeight = ceil((collectionHeight - top - bottom - (self.rowCount - 1)*lineSpacing)/(self.rowCount * 1.f));
    
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < itemsCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        NSInteger currentPage = i / pageCount;
        NSInteger indexOfPage = i % pageCount;
        CGFloat x = left + i % self.columnCount * (cellWidth + itemSpacing) + currentPage * collectionWidth;
        CGFloat y = top + indexOfPage / self.columnCount * (cellHeight + lineSpacing);
        attribute.frame = CGRectMake(x, y, cellWidth, cellHeight);
        [array addObject:attribute];
    }
    self.attributes = [array copy];
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame) * self.pageNumber, CGRectGetHeight(self.collectionView.frame));
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.attributes[indexPath.row];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *inRectArray = [NSMutableArray arrayWithCapacity:0];
    for (UICollectionViewLayoutAttributes *attribute in self.attributes) {
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            [inRectArray addObject:attribute];
        }
    }
    return inRectArray;
}
@end
