//
//  NHAttentionModel.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHAttentionModel : NSObject

@property(nonatomic,strong) NSString* title;

@property(nonatomic,strong) NSString* detailTitle;

@property(nonatomic,strong) NSString* image;

@property(nonatomic,strong) NSString* button;

@property(nonatomic,strong) NSString* buttonTitle;

@property(nonatomic,assign) NSUInteger buttonTitleColor;

@property(nonatomic,strong) NSDictionary* otherData;

-(instancetype)initWithTitle:(NSString*)title detailTitle:(NSString*)detailTitle image:(NSString*)image button:(NSString*)button;

-(instancetype)initWithTitle:(NSString*)title detailTitle:(NSString*)detailTitle image:(NSString*)image button:(NSString*)button buttonTitle:(NSString*)buttonTitle buttonTitleColor:(NSUInteger)buttonTitleColor;

-(instancetype)initWithTitle:(NSString*)title detailTitle:(NSString*)detailTitle image:(NSString*)image button:(NSString*)button buttonTitle:(NSString*)buttonTitle buttonTitleColor:(NSUInteger)buttonTitleColor otherData:(NSDictionary*)otherData;

@end
