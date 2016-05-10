//
//  NHAttentionItemView.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NHAttentionItemViewDeletage <NSObject>

-(void)didAttention:(UIButton*)attention tag:(NSInteger)tag;

@end

@interface NHAttentionItemView : UIView

@property(nonatomic,weak) id<NHAttentionItemViewDeletage> deletage;

@property(nonatomic,strong) NSString* title;

@property(nonatomic,strong) NSString* detailTitle;

@property(nonatomic,strong) NSString* image;

@property(nonatomic,strong) NSString* buttonTitle;

@property(nonatomic,assign) NSUInteger buttonTitleColor;

@property(nonatomic,strong) NSString* buttonBackgroundImage;

-(instancetype)initWithFrame:(CGRect)frame;

@end
