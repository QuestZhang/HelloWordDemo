//
//  LineLayout.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LineLayoutDeletage <UICollectionViewDelegateFlowLayout>

-(void)reloadData;

@end

@interface LineLayout : UICollectionViewFlowLayout

@property(nonatomic,strong) id<LineLayoutDeletage> deletage;

@end
