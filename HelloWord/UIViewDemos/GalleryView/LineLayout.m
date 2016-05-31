//
//  LineLayout.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "LineLayout.h"

@interface LineLayout()

@end

static const CGFloat ItemWH = 50;
static const CGFloat HMItemWH = ItemWH;

@implementation LineLayout

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

/**
 *  只要显示的边界发生改变就重新布局:
 内部会重新调用prepareLayout和layoutAttributesForElementsInRect方法获得所有cell的布局属性
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

/**
 *  用来设置collectionView停止滚动那一刻的位置
 *
 *  @param proposedContentOffset 原本collectionView停止滚动那一刻的位置
 *  @param velocity              滚动速度
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    // 1.计算出scrollView最后会停留的范围
    CGRect lastRect;
    lastRect.origin = proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    // 计算屏幕最中间的x
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 2.取出这个范围内的所有属性
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    
    // 3.遍历所有属性
    CGFloat adjustOffsetX = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(attrs.center.x - centerX) < ABS(adjustOffsetX)) {
            adjustOffsetX = attrs.center.x - centerX;
        }
    }
    return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y);
}

/**
 *  一些初始化工作最好在这里实现
 */
- (void)prepareLayout{
    
    [super prepareLayout];
    
    // 每个cell的尺寸
    self.itemSize = CGSizeMake(ItemWH, ItemWH);
    CGFloat inset = (self.collectionView.frame.size.width - HMItemWH) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    // 设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //self.minimumLineSpacing = ItemWH * 0.7;
    //self.minimumLineSpacing = 1.0;//行间距
    self.minimumInteritemSpacing = 1.0;
    // 每一个cell(item)都有自己的UICollectionViewLayoutAttributes
    // 每一个indexPath都有自己的UICollectionViewLayoutAttributes
}

/** 有效距离:当item的中间x距离屏幕的中间x在HMActiveDistance以内,才会开始放大, 其它情况都是缩小 */
//static CGFloat const ActiveDistance = 1.0;
/** 缩放因素: 值越大, item就会越大 */
//static CGFloat const ScaleFactor = 1.0;

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    // 0.计算可见的矩形框
    CGRect visiableRect;
    visiableRect.size = self.collectionView.frame.size;
    visiableRect.origin = self.collectionView.contentOffset;
    
    // 1.取得默认的cell的UICollectionViewLayoutAttributes
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    // 计算屏幕最中间的x
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;

    // 2.遍历所有的布局属性
    for (UICollectionViewLayoutAttributes *attrs in array) {
        // 如果不在屏幕上,直接跳过
        if (!CGRectIntersectsRect(visiableRect, attrs.frame)) continue;
        
        // 每一个item的中点x
        CGFloat itemCenterX = attrs.center.x;

        // 差距越小, 缩放比例越大
        // 根据跟屏幕最中间的距离计算缩放比例
        //CGFloat scale = 1 + ScaleFactor * (1 - (ABS(itemCenterX - centerX) / ActiveDistance));
        //if (itemCenterX == centerX) {
            //attrs.transform = CGAffineTransformMakeScale(2, 2);
        //}
        //原来代码的缩放
        //attrs.transform = CGAffineTransformMakeScale(1, 1);
        
//====================================================================================
        
        CGFloat scale =  1+  (1- (ABS(centerX - itemCenterX)/30 > 1 ? 1 : ABS(centerX - itemCenterX)/30));
        //attrs.transform = CGAffineTransformMakeScale(scale, scale);
        //attrs.alpha = ABS(1-scale);
        attrs.size = CGSizeMake(ItemWH*scale, ItemWH*scale);
    }
    return array;
}

//设置Content大小
//- (CGSize)collectionViewContentSize{
//    NSLog(@"collectionViewContentSize=============");
//    return CGSizeMake(200, 200);
//}

//修改item的大小
-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes* attrs = [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
    
    return attrs;
}

//返回每个cell对应的属性//点击单个item时候触发
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

@end
