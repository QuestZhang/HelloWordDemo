//
//  RecommendNHView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/12.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "RecommendNHView.h"
#import "DKNightVersion.h"

@interface RecommendNHView()

@property(nonatomic,strong) UILabel* titleLabel;

@property(nonatomic,strong) UIView* contentView;

@property(nonatomic,strong) UILabel* nicknameLabel;

@property(nonatomic,strong) UILabel* nicknameDescriptionLabel;

@property(nonatomic,strong) UILabel* recommendReasonLabel;

@property(nonatomic,strong) UIButton* attentionButton;

@end

@implementation RecommendNHView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:[self lineWithY:CGRectGetMaxY(self.titleLabel.frame)]];
        [self addSubview:self.contentView];
        [self addSubview:self.nicknameLabel];
        [self addSubview:self.nicknameDescriptionLabel];
        [self addSubview:self.recommendReasonLabel];
        [self addSubview:self.attentionButton];
        [self addSubview:[self lineWithY:CGRectGetMaxY(self.attentionButton.frame)+20]];
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    _title = [title copy];
    self.titleLabel.text = title;
}

-(void)setNickname:(NSString *)nickname{
    _nickname = [nickname copy];
    self.nicknameLabel.text = nickname;
}

-(void)setNicknameDescription:(NSString *)nicknameDescription{
    _nicknameDescription = [nicknameDescription copy];
    self.nicknameDescriptionLabel.text = nicknameDescription;

}

-(void)setRecommendReason:(NSString *)recommendReason{
    _recommendReason = [recommendReason copy];
    NSString* reasonString = [NSString stringWithFormat:@"推荐理由:%@",recommendReason];
    self.recommendReasonLabel.text = reasonString;
}

-(void)setAttentonBackgroundImage:(NSString*)image title:(NSString*)title{
    [self.attentionButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.attentionButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [self.attentionButton setTitle:title forState:UIControlStateNormal];
    [self.attentionButton setTitle:title forState:UIControlStateHighlighted];
}

-(void)addSubviewOfContentView:(UIView*)subview{
    subview.frame = self.contentView.bounds;
    [self.contentView addSubview:subview];
    
}

-(void)addSubviewOfContentViewWithNib:(NSString*)name{
    UIView* view = [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] lastObject];
    [self addSubviewOfContentView:view];
}

-(void)didAttention:(UIButton*)button{
    if (self.onClickHandler != nil && [self respondsToSelector:@selector(onClickHandler)]) {
        self.onClickHandler();
    }
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        CGRect frame = CGRectMake(10, 0, self.frame.size.width/2, 38);
        _titleLabel = [[UILabel alloc] initWithFrame:frame];
        _titleLabel.dk_textColorPicker = DKColorWithRGB(0x000000, 0xFFFFFF);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}

-(UIView *)contentView{
    if (_contentView == nil) {
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), self.frame.size.width, 136);
        _contentView = [[UIView alloc] initWithFrame:frame];
    }
    return _contentView;
}

-(UILabel *)nicknameLabel{
    if (_nicknameLabel == nil) {
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.contentView.frame), self.frame.size.width/2-14-10, 18);
        _nicknameLabel = [[UILabel alloc] initWithFrame:frame];
        _nicknameLabel.dk_textColorPicker = DKColorWithRGB(0x000000, 0x000000);
        _nicknameLabel.font = [UIFont systemFontOfSize:18];
        _nicknameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _nicknameLabel;
}

-(UILabel *)nicknameDescriptionLabel{
    if (_nicknameDescriptionLabel == nil) {
        CGRect frame = CGRectMake(self.frame.size.width/2-14, CGRectGetMaxY(self.contentView.frame)+4, self.frame.size.width-14, 14);
        _nicknameDescriptionLabel = [[UILabel alloc] initWithFrame:frame];
        _nicknameDescriptionLabel.dk_textColorPicker = DKColorWithRGB(0xE22222, 0x000000);
        _nicknameDescriptionLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nicknameDescriptionLabel;
}

-(UILabel *)recommendReasonLabel{
    if (_recommendReasonLabel == nil) {
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.nicknameLabel.frame)+15, self.frame.size.width, 14);
        _recommendReasonLabel = [[UILabel alloc] initWithFrame:frame];
        _recommendReasonLabel.font = [UIFont systemFontOfSize:14];
        _recommendReasonLabel.textAlignment = NSTextAlignmentCenter;
        _recommendReasonLabel.dk_textColorPicker = DKColorWithRGB(0x333333, 0x000000);
    }
    return _recommendReasonLabel;
}

-(UIButton *)attentionButton{
    if (_attentionButton == nil) {
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.recommendReasonLabel.frame)+20, 160/2, 55/2);
        _attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _attentionButton.frame = frame;
        _attentionButton.center = CGPointMake(self.frame.size.width/2, _attentionButton.center.y);
        [_attentionButton dk_setTitleColorPicker:DKColorWithRGB(0xE22222, 0x000000) forState:UIControlStateNormal];
        _attentionButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_attentionButton addTarget:self action:@selector(didAttention:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attentionButton;
}

-(UILabel*)lineWithY:(CGFloat)y{
    UILabel* line = [[UILabel alloc] initWithFrame:CGRectMake(0, y, self.frame.size.width, 0.5f)];
    line.dk_backgroundColorPicker = DKColorWithRGB(0xEEEEEE,0x000000);
    return line;
}

@end
