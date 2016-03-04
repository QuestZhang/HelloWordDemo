//
//  BottomView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/1.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "BottomView.h"
#import "SocialGroupView.h"

@interface BottomView()

@property(strong,nonatomic) UIButton *btnWriteComment;
@property(strong,nonatomic) UIButton *btnShowComment;
@property(strong,nonatomic) UIButton *btnFavorites;
@property(strong,nonatomic) UIButton *btnSharePlateFrom;
@property(strong,nonatomic) SocialGroupView *socialGroupView;

-(void) initChildViews;//初始化子类

-(void) addchildViews;//添加子类

-(void) onClick:(UIButton *) button;

@end


@implementation BottomView

@synthesize bottomViewDelegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initChildViews];
        
        [self addchildViews];
    }
    return self;
}

-(void) initChildViews{ //初始化子类
    
    _btnWriteComment = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnShowComment = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnFavorites = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSharePlateFrom = [UIButton buttonWithType:UIButtonTypeCustom];
    _socialGroupView = [[SocialGroupView alloc] initWithFrame:CGRectMake(self.frame.size.width/2,12, self.frame.size.width/2, 30)];
//    _socialGroupView.backgroundColor = [UIColor redColor];
    
    _btnWriteComment.frame = CGRectMake(10, 9, self.frame.size.width/2-10, 30);
    [_btnWriteComment setTitle:@"写评论..." forState:UIControlStateNormal];
    [_btnWriteComment setTitleColor:UIColorFromRGB(0x3F3F3F) forState:UIControlStateNormal];
    _btnWriteComment.backgroundColor = UIColorFromRGB(0xFFFFFF);
    _btnWriteComment.titleLabel.font = [UIFont systemFontOfSize: 12];
    _btnWriteComment.titleLabel.textAlignment = NSTextAlignmentLeft;
    [_btnWriteComment setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, (self.frame.size.width/2-10)/2)];
    _btnWriteComment.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _btnWriteComment.layer.cornerRadius = 15.0;
    _btnWriteComment.layer.borderWidth = 1.0;
    /* 设置边框颜色*/
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorRef = CGColorCreate(colorSpace, (CGFloat[]){249,249,249,1});
//    [_btnWriteComment.layer setBorderColor:colorRef];
    
    _btnWriteComment.layer.borderColor = [UIColorFromRGB(0xDBDBDB)CGColor]; //边框颜色
    [_btnWriteComment setTag:0];
    [_btnWriteComment addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_socialGroupView addButton:_btnShowComment source:@"new_review_tabbar"];
    [_btnShowComment setTag:1];
    [_btnShowComment addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_socialGroupView addButton:_btnFavorites source:@"love_video_night"];
    [_btnFavorites setTag:2];
    [_btnFavorites addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_socialGroupView addButton:_btnSharePlateFrom source:@"new_share_tabbar_normal"];
    [_btnSharePlateFrom setTag:3];
    [_btnSharePlateFrom addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_socialGroupView layoutChildView];
}

- (void) addchildViews{//添加子类
    
    [self addSubview:_btnWriteComment];
    [self addSubview:_socialGroupView];
}


- (void) onClick:(UIButton *)button{
    if(button == nil){
        return;
    }
    NSInteger tag = [button tag];
    switch (tag) {
        case 0:
            [self.bottomViewDelegate onClickWritComment];
            break;
        case 1:
            [self.bottomViewDelegate onClickShowComment];
            break;
        case 2:
            [self.bottomViewDelegate onClickFavorites];
            break;
        case 3:
            [self.bottomViewDelegate onClickSharePlateFrom];
            break;
            
        default:
            break;
    }

}

@end

