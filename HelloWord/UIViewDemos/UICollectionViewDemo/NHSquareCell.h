//
//  NHSquareCellCollectionViewCell.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHSquareCell : UICollectionViewCell

@property(nonatomic,strong) NSString* title;

@property(nonatomic,strong) NSString* detailTitle;

@property(nonatomic,strong) NSString* image;

@property(nonatomic,strong) UIButton* attention;

@end
