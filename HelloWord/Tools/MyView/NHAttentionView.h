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

//更多按钮点击事件
-(void)onClickOfMore:(UIButton*)moreButton;

//点解整个item 返回itemView 与返回Model同时执行
-(void)onClickOfItem:(NHAttentionItemView*)item;

//点击这个item 返回Item的Model 与返回ItemView同时执行
-(void)onClickItemForModel:(NHAttentionModel*)model;

//点击关注按钮返回对应字典
-(void)onClickOfAttentionOtherData:(NSDictionary*)otherData;

@end

@interface NHAttentionView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,weak) id<NHAttentionViewDeletage> deletage;

-(void)setTitle:(NSString*)title image:(NSString*)image;

-(void)setMoreTitle:(NSString*)moreTitle moreImage:(NSString*)moreImage;

-(void)execute;

@property(nonatomic,strong) NSMutableArray<NSString*>* tags;

@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data;

@end
