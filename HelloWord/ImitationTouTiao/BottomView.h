//
//  BottomView.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/1.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomViewDelegate <NSObject>

@required
-(void)onClickWritComment;
@required
-(void)onClickShowComment;
@required
-(void)onClickFavorites;
@required
-(void)onClickSharePlateFrom;

@end

@interface BottomView : UIView

@property(strong,nonatomic) id<BottomViewDelegate> bottomViewDelegate;

@end
