//
//  DetialShowCountView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/3.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "DetialShowCountView.h"

@interface DetialShowCountView()

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UILabel *label;

-(void) initImageView;
-(void) initLabel;
-(void) addTarget:(UIView *)view;

@end

@implementation DetialShowCountView

@synthesize deletage;

CGFloat width;
CGFloat height;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self != nil){
        width = self.frame.size.width;
        height = self.frame.size.height;
        [self initImageView];
        [self initLabel];
         UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addTarget:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)initImageView{
    CGFloat imageSidelen;
    if((width/2) >= height){
        imageSidelen = height;
    }else if(width/2 <height){
        imageSidelen = width/2;
    }
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,imageSidelen, imageSidelen)];
    _imageView.layer.cornerRadius = imageSidelen/2;
    _imageView.layer.masksToBounds = YES;
    [self addSubview:_imageView];

}

-(void)initLabel{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(width/2+5, 0, width/2, height)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = UIColorFromRGB(0xDBDBDB);
    [self addSubview:_label];
}



- (void) setImageViewForImage:(UIImage *)image{
    
    _imageView.image = image;

}

- (void) setLableWithString:(NSString *)stringCount{

    _label.text = stringCount;
   }

-(void)addTarget:(UIView *)view{
    [deletage onAction:view];
}


@end
