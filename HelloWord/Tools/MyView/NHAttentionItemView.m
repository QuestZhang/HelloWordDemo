//
//  NHAttentionItemView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NHAttentionItemView.h"
#import "DKNightVersion.h"

@interface NHAttentionItemView()

@property(nonatomic,assign) CGFloat selfW;

@property(nonatomic,assign) CGFloat selfH;

@property(nonatomic,strong) UILabel* titleLabel;

@property(nonatomic,strong) UILabel* detailTitleLable;

@property(nonatomic,strong) UIImageView* imageView;

@property(nonatomic,strong) UIButton* attention;

@end

@implementation NHAttentionItemView

-(void)setTitle:(NSString *)title{
    _title = [title copy];
    
    if (title == nil || title.length == 0) {
        self.titleLabel.text = @"";
    }else{
        self.titleLabel.text = title;
    }
}

-(void)setDetailTitle:(NSString *)detailTitle{
    _detailTitle = [detailTitle copy];
    
    if (detailTitle == nil || detailTitle.length == 0) {
        self.detailTitleLable.text = @"";
    }else{
        self.detailTitleLable.text = detailTitle;
    }
}

-(void)setImage:(NSString *)image{
    _image = [image copy];
    
    if (image != nil && image.length != 0) {
        if ([image hasPrefix:@"http://"] || [image hasPrefix:@"https://"]) {
            NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:image]];
            self.imageView.image = [UIImage imageWithData:imageData];
        }else{
            self.imageView.image = [UIImage imageNamed:@"默认图片"];
        }
    }else{
        self.imageView.image = [UIImage imageNamed:@"默认图片"];
    }
}

-(void)setButtonTitle:(NSString *)buttonTitle{
    _buttonTitle = [buttonTitle copy];
    
    if (buttonTitle != nil && buttonTitle.length !=0 ) {
        [self.attention setTitle:buttonTitle forState:UIControlStateNormal];
        [self.attention setTitle:buttonTitle forState:UIControlStateHighlighted];
    }else{
        [self.attention setTitle:@"click" forState:UIControlStateNormal];
        [self.attention setTitle:@"click" forState:UIControlStateHighlighted];
    }
    
}

-(void)setButtonTitleColor:(NSUInteger)buttonTitleColor{
    _buttonTitleColor = buttonTitleColor;
    
    if (buttonTitleColor != 0) {
        [self.attention dk_setTitleColorPicker:DKColorWithRGB(buttonTitleColor, 0x333333) forState:UIControlStateNormal];
        [self.attention dk_setTitleColorPicker:DKColorWithRGB(buttonTitleColor, 0x333333) forState:UIControlStateHighlighted];
    }else{
        [self.attention dk_setTitleColorPicker:DKColorWithRGB(0x666666, 0x333333) forState:UIControlStateNormal];
        [self.attention dk_setTitleColorPicker:DKColorWithRGB(0x666666, 0x333333) forState:UIControlStateHighlighted];
    }
}

-(void)setButtonBackgroundImage:(NSString *)buttonBackgroundImage{
    _buttonBackgroundImage = [buttonBackgroundImage copy];
    
    if (buttonBackgroundImage != nil && buttonBackgroundImage.length != 0) {
        if ([buttonBackgroundImage hasPrefix:@"http://"]||[buttonBackgroundImage hasPrefix:@"https://"]) {
            NSData* backgroundImageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:buttonBackgroundImage]];
            if (backgroundImageData == nil) {
                [self.attention setBackgroundImage:[UIImage imageNamed:@"默认图片"] forState:UIControlStateNormal];
            }else{
                [self.attention setBackgroundImage:[UIImage imageWithData:backgroundImageData] forState:UIControlStateNormal];
                [self.attention setBackgroundImage:[UIImage imageWithData:backgroundImageData] forState:UIControlStateHighlighted];
            }
        }else{
            [self.attention setBackgroundImage:[UIImage imageNamed:buttonBackgroundImage] forState:UIControlStateNormal];
            [self.attention setBackgroundImage:[UIImage imageNamed:buttonBackgroundImage] forState:UIControlStateHighlighted];
        }
    }else{
        [self.attention setBackgroundImage:[UIImage imageNamed:@"默认图片"] forState:UIControlStateNormal];
    }
    if (self.deletage != nil) {
        [self.deletage didAttention:self.attention tag:self.tag];
    }
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.dk_backgroundColorPicker = DKColorWithRGB(0xFFFFFF,0x000000);
        _selfW = self.frame.size.width;
        _selfH = self.frame.size.height;
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailTitleLable];
        [self addSubview:self.imageView];
        [self addSubview:self.attention];
    }
    return self;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        CGRect frame = CGRectMake(0, 15, self.selfW, 17);
        _titleLabel = [[UILabel alloc] initWithFrame:frame];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.dk_textColorPicker = DKColorWithRGB(0x000000, 0xFFFFFF);
    }
    return _titleLabel;
}

-(UILabel *)detailTitleLable{
    if (_detailTitleLable == nil) {
        CGRect frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame)+8, self.selfW, 14);
        _detailTitleLable = [[UILabel alloc] initWithFrame:frame];
        _detailTitleLable.font = [UIFont systemFontOfSize:14];
        _detailTitleLable.dk_textColorPicker = DKColorWithRGB(0x999999,0x000000);
    }
    return _detailTitleLable;
}

-(UIImageView *)imageView{
    if (_imageView == nil) {
        CGRect frame = CGRectMake(CGRectGetMinX(self.detailTitleLable.frame), CGRectGetMaxY(self.detailTitleLable.frame)+10, self.selfW, self.selfW/3*2);
        _imageView = [[UIImageView alloc] initWithFrame:frame];
        _imageView.center = CGPointMake(self.selfW/2, _imageView.center.y);
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}


-(UIButton *)attention{
    if (_attention == nil) {
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+15, self.selfW/2, self.selfW/4);
        _attention = [UIButton buttonWithType:UIButtonTypeCustom];
        _attention.frame = frame;
        _attention.center = CGPointMake(self.selfW/2, _attention.center.y);
        _attention.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _attention;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
