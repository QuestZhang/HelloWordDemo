//
//  NHAttentionModel.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NHAttentionModel.h"

@implementation NHAttentionModel

-(instancetype)initWithTitle:(NSString*)title detailTitle:(NSString*)detailTitle image:(NSString*)image button:(NSString*)button{
    if (self = [super init]) {
        self.title       = title;
        self.detailTitle = detailTitle;
        self.image       = image;
        self.button      = button;
    }
    return  self;
}

-(instancetype)initWithTitle:(NSString*)title detailTitle:(NSString*)detailTitle image:(NSString*)image button:(NSString*)button buttonTitle:(NSString*)buttonTitle buttonTitleColor:(NSUInteger)buttonTitleColor{
    if (self = [super init]) {
        self.title            = title;
        self.detailTitle      = detailTitle;
        self.image            = image;
        self.button           = button;
        self.buttonTitle      = buttonTitle;
        self.buttonTitleColor = buttonTitleColor;
    }
    return  self;
}

-(instancetype)initWithTitle:(NSString*)title detailTitle:(NSString*)detailTitle image:(NSString*)image button:(NSString*)button buttonTitle:(NSString*)buttonTitle buttonTitleColor:(NSUInteger)buttonTitleColor otherData:(NSDictionary*)otherData{
    if (self = [super init]) {
        self.title            = title;
        self.detailTitle      = detailTitle;
        self.image            = image;
        self.button           = button;
        self.buttonTitle      = buttonTitle;
        self.buttonTitleColor = buttonTitleColor;
        self.otherData        = otherData;
    }
    return  self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"NHAttentionModel[title=%@,detailTitle=%@,image=%@,button=%@,buttonTitle=%@,buttonTitleColor=%@,otherData=%@]",self.title,self.detailTitle,self.image,self.button,self.buttonTitle,@(self.buttonTitleColor),self.otherData.description];
}

@end
