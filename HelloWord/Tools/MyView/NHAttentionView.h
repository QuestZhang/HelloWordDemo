//
//  NHAttentionView.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHAttentionItemView.h"
#import "NHAttentionModel.h"

@class NHAttentionView;

@protocol NHAttentionViewDeletage <NSObject>

-(void)onClickOfMore:(UIButton*)moreButton;

-(void)onClickOfItem:(NHAttentionItemView*)item;

-(void)onClickItemForModel:(NHAttentionModel*)model;

-(void)onClickOfAttentionTag:(NSInteger)tag;

@end

@interface NHAttentionView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,weak) id<NHAttentionViewDeletage> deletage;

-(void)setTitle:(NSString*)title image:(NSString*)image;

-(void)setMoreTitle:(NSString*)moreTitle moreImage:(NSString*)moreImage;

-(void)execute;

@property(nonatomic,strong) NSMutableArray* tags;

@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data;

@end
