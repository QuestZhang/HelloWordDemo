//
//  RecommendNHView.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/12.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OnClickHandler)(void);

@interface RecommendNHView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,strong) NSString* title;

@property(nonatomic,strong) NSString* nickname;

@property(nonatomic,strong) NSString* nicknameDescription;

@property(nonatomic,strong) NSString* recommendReason;

@property(nonatomic,weak) OnClickHandler onClickHandler;

-(void)setAttentonBackgroundImage:(NSString*)image title:(NSString*)title;

-(void)addSubviewOfContentView:(UIView*)subview;

-(void)addSubviewOfContentViewWithNib:(NSString*)name;

@end
