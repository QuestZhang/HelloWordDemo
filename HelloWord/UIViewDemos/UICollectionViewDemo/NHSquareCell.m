//
//  NHSquareCellCollectionViewCell.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NHSquareCell.h"

@interface NHSquareCell()

@property(nonatomic,assign) CGFloat screenW;
@property(nonatomic,assign) CGFloat screenH;
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,strong) UILabel* titleLabel;
@property(nonatomic,strong) UILabel* detailTitleLabel;
@property(nonatomic,strong) UIImageView* imageView;

@end

@implementation NHSquareCell

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailTitleLabel];
    [self addSubview:self.imageView];
    [self addSubview:self.attention];
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        CGRect frame = CGRectMake(0, 15, self.width, 17);
        _titleLabel = [[UILabel alloc] initWithFrame:frame];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}

-(void)setTitle:(NSString *)title{
    _title = [title copy];
    
    if (title == nil || title.length == 0) {
        self.titleLabel.text = @"默认Title";
    }else{
        self.titleLabel.text = title;
    }
}

-(UILabel *)detailTitleLabel{
    if (_detailTitleLabel == nil) {
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+8, self.width, 14);
        _detailTitleLabel = [[UILabel alloc] initWithFrame:frame];
        _detailTitleLabel.textColor = [UIColor colorWithRed:99.f green:9.f blue:99.f alpha:1];
        _detailTitleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _detailTitleLabel;
}

-(void)setDetailTitle:(NSString *)detailTitle{
    _detailTitle = [detailTitle copy];
    
    if (detailTitle == nil || detailTitle.length == 0) {
        self.detailTitleLabel.text = @"默认DetailTitle";
    }else{
        self.detailTitleLabel.text = detailTitle;
    }
}

-(UIImageView *)imageView{
    if (_imageView == nil) {
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.detailTitleLabel.frame), self.width-5, self.height/3);
        _imageView = [[UIImageView alloc] initWithFrame:frame];
    }
    return _imageView;
}

-(void)setImage:(NSString *)image{
    _image = [image copy];
    
    if ([image hasPrefix:@"http://"] || [image hasPrefix:@"https://"]) {
        NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:image]];
        if (imageData != nil) {
            self.imageView.image = [UIImage imageWithData:imageData];
        }else{
            self.imageView.image = [UIImage imageNamed:@"AppIcon"];
        }
    }else{
        self.imageView.image = [UIImage imageNamed:@"AppIcon"];
    }
}

-(UIButton *)attention{
    if (_attention == nil) {
        _attention = [UIButton buttonWithType:UIButtonTypeCustom];
        _attention.frame = CGRectMake(0, 0, self.width/2, self.width/4);
        _attention.center = CGPointMake(self.center.x, self.height-20);
        [_attention setTitleColor:[UIColor colorWithRed:99 green:99 blue:99 alpha:1] forState:UIControlStateNormal];
    }
    return _attention;
}

-(CGFloat)width{
    if (_width == 0) {
        _width = self.frame.size.width;
    }
    return _width;
}

-(CGFloat)height{
    if (_height == 0) {
        _height = self.frame.size.height;
    }
    return _height;
}

-(CGFloat)screenW{
    if (_screenW == 0) {
        _screenW = [UIScreen mainScreen].bounds.size.width;
    }
    return _screenW;
}

-(CGFloat)screenH{
    if (_screenH == 0) {
        _screenH = [UIScreen mainScreen].bounds.size.height;
    }
    return _screenW;
}

@end
