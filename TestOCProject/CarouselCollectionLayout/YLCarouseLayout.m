//
//  YLCarouseLayout.m
//  TestOCProject
//
//  Created by wl on 2019/7/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLCarouseLayout.h"

@implementation YLCarouseLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *original = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributes = [[NSArray alloc]initWithArray:original copyItems:YES];
    CGFloat centerX = self.collectionView.contentOffset.x + self.width/2.f;
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        CGFloat distanceToCenterX = ABS(attr.center.x - centerX);
        CGFloat rate = 1 - distanceToCenterX/self.width * (0.2);
        attr.transform = CGAffineTransformMakeScale(rate, rate);
        attr.alpha = rate;
    }
    return attributes;
}

- (void)prepareLayout
{
    [super prepareLayout];
    CGFloat left = (self.width - self.itemSize.width)/2.f;
    self.sectionInset = UIEdgeInsetsMake(25, left, 25, left);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGFloat)width{
    return self.collectionView.bounds.size.width;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGPoint contentOffset = self.collectionView.contentOffset;
    CGFloat collectionWidth = self.width;
    if ((proposedContentOffset.x <= 0 && contentOffset.x < 0) || proposedContentOffset.x >= self.collectionView.contentSize.width - collectionWidth) {
        return proposedContentOffset;
    }
    
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = contentOffset.x;
    rect.size= self.collectionView.frame.size;
    
    NSArray *attrbutes = [super layoutAttributesForElementsInRect:rect].copy;
    CGFloat minDistance = self.itemSize.width + self.minimumInteritemSpacing;
    CGFloat centerX = contentOffset.x + collectionWidth*0.5;
    for (UICollectionViewLayoutAttributes *attr in attrbutes) {
        if (ABS(minDistance) > ABS(attr.center.x - centerX)) {
            CGFloat distance = attr.center.x - centerX;
            if (velocity.x > 0 && distance < 0) {
                continue;
            }else if (velocity.x < 0 && distance > 0){
                continue;
            }
            minDistance = distance;
        }
    }
    
    contentOffset.x += minDistance;
    if (contentOffset.x < 0) {
        contentOffset.x = 0;
    }
    if (contentOffset.x > self.collectionView.contentSize.width - collectionWidth) {
        contentOffset.x = self.collectionView.contentSize.width - collectionWidth;
    }
    return contentOffset;
}
@end
