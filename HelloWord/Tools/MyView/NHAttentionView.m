//
//  NHAttentionView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//
#define titleH   35.0f
#define lineH    0.5f
#define FontSize 15.0f
#define ItmeH    190

#import "NHAttentionView.h"
#import "DKNightVersion.h"

@interface NHAttentionView()<NHAttentionItemViewDeletage>

@property(nonatomic,assign) CGFloat selfW;

@property(nonatomic,assign) CGFloat selfH;

@property(nonatomic,strong) UIButton* titleButton;

@property(nonatomic,strong) UIButton* moreButton;

@property(nonatomic,strong) UIView* contentView;

@end

@implementation NHAttentionView

@synthesize tags,data;

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _selfW = self.frame.size.width;
        _selfH = self.frame.size.height;
        [self addSubview:self.titleButton];
        [self addSubview:self.moreButton];
        [self addSubview:[self lineWithY:titleH]];
        [self addSubview:self.contentView];
        [self addSubview:[self lineWithY:CGRectGetMaxY(self.contentView.frame)]];
    }
    return  self;
}

-(void)execute{
    NHAttentionItemView* itemView = nil;
    CGFloat itemW = self.contentView.frame.size.width;
    for (NSString* tag in self.tags) {
        NSInteger i = [tag integerValue];
        CGRect frame = CGRectMake((i-1)*itemW/self.tags.count, 0, itemW/self.tags.count-2.5, ItmeH);
        itemView = [self MakeItemViewWithFrame:frame tag:i];
        [self.contentView addSubview:itemView];
    }
}

-(void)setTitle:(NSString*)title image:(NSString*)image{
    [self.titleButton setTitle:title forState:UIControlStateNormal];
    [self.titleButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.titleButton setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];

}

-(void)setMoreTitle:(NSString*)moreTitle moreImage:(NSString*)moreImage{
    [self.moreButton setTitle:moreTitle forState:UIControlStateNormal];
    [self.moreButton setImage:[UIImage imageNamed:moreImage] forState:UIControlStateNormal];
    [self.moreButton setImage:[UIImage imageNamed:moreImage] forState:UIControlStateHighlighted];
    CGFloat leftOrRight = self.moreButton.imageView.frame.size.width + self.moreButton.titleLabel.frame.size.width;
    self.moreButton.titleEdgeInsets = UIEdgeInsetsMake(0, -leftOrRight, 0, 0);
    self.moreButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -1.8f*leftOrRight);
}

-(NHAttentionItemView*)MakeItemViewWithFrame:(CGRect)frame tag:(NSInteger)tag{
    NHAttentionItemView* itemView = nil;
    if ([self viewWithTag:tag]) {
        itemView                          = (NHAttentionItemView*)[self viewWithTag:tag];
    }else{
        itemView                          = [[NHAttentionItemView alloc] initWithFrame:frame];
        itemView.deletage                 = self;
        itemView.tag                      = tag;
        itemView.userInteractionEnabled   = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPress:)];
        [itemView addGestureRecognizer:singleTap];
    }
    NHAttentionModel* model        = [self.data objectAtIndex:tag-1];
    itemView.title                 = model.title;
    itemView.detailTitle           = model.detailTitle;
    itemView.image                 = model.image;
    itemView.buttonBackgroundImage = model.button;
    itemView.buttonTitle           = model.buttonTitle;
    itemView.buttonTitleColor      = model.buttonTitleColor;
    return itemView;
}

-(void)didAttention:(UIButton*)attention tag:(NSInteger)tag{
    attention.tag = tag;
    [attention addTarget:self action:@selector(didAttion:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)didAttion:(UIButton*)button{
    if (self.deletage != nil && [self.deletage respondsToSelector:@selector(onClickOfAttentionOtherData:)]) {
        NHAttentionModel* model = self.data[button.tag-1];
        [self.deletage onClickOfAttentionOtherData:model.otherData];
    }
}

-(void)buttonPress:(UITapGestureRecognizer*) singleTap{
    NHAttentionItemView* itemView = (NHAttentionItemView*)singleTap.view;
    if (self.deletage != nil && [self.deletage respondsToSelector:@selector(onClickOfItem:)]) {
        [self.deletage onClickOfItem:itemView];
        [self.deletage onClickItemForModel:self.data[itemView.tag-1]];
    }
}

-(UIView*)lineWithY:(CGFloat)Y{
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.selfW, lineH)];
    line.dk_backgroundColorPicker = DKColorWithRGB(0x999999,0x000000);
    line.center = CGPointMake(self.selfW/2, Y);
    return line;
}

-(void)didMore:(UIButton*)button{
    if(self.deletage != nil && [self.deletage respondsToSelector:@selector(onClickOfMore:)]){
        [self.deletage onClickOfMore:button];
    }
}

-(void)setTags:(NSMutableArray<NSString*> *)aTags{
    if([aTags[0] integerValue] < 1){
        NSException* ex = [[NSException alloc] initWithName:@"HNAttentionView" reason:@"(腾飞)tags数据从@\"1\"自然顺序开始" userInfo:nil];
        @throw (ex);
    }
    tags = [aTags copy];
}

-(NSMutableArray<NSString*> *)tags{
    if (tags == nil) {
        tags = [NSMutableArray array];
    }
    return tags;
}

-(void)setData:(NSMutableArray<NHAttentionModel *> *)aData{
    data = [aData copy];
}

-(NSMutableArray<NHAttentionModel *> *)data{
    if (data == nil) {
        data = [NSMutableArray array];
    }
    return data;
}

-(UIButton *)titleButton{
    if (_titleButton == nil) {
        CGRect frame = CGRectMake(0, 0, self.selfW/3, titleH);
        _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleButton.frame = frame;
        _titleButton.center = CGPointMake(self.selfW/2, titleH/2);
        _titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        //_titleButton.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 0);
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:FontSize];
        [_titleButton dk_setTitleColorPicker:DKColorWithRGB(0xE22222,0x000000) forState:UIControlStateNormal];
        //[_titleButton addTarget:self action:@selector(didMore:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleButton;
}

-(UIButton *)moreButton{
    if (_moreButton == nil) {
        CGRect frame = CGRectMake(self.selfW-55, 0, 45, titleH);
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.frame = frame;
        //_moreButton.titleEdgeInsets = UIEdgeInsetsMake(0, _moreButton.imageView.frame.size.width, 0, 0);
        //_moreButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, _moreButton.titleLabel.frame.size.width);
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:FontSize];
        [_moreButton dk_setTitleColorPicker:DKColorWithRGB(0x999999,0x000000) forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(didMore:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

-(UIView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(7.5f, titleH+lineH, CGRectGetMaxX(self.frame)-15.0f, ItmeH)];
//        _contentView.center = CGPointMake(self.selfW/2, self.center.y);
    }
    return _contentView;
}

-(UIView*)CuttingLineWithY:(CGFloat)y{
    CGRect frame = CGRectMake(0, y, self.frame.size.width, 10);
    UIView* cuttingLine = [[UIView alloc] initWithFrame:frame];
    cuttingLine.dk_backgroundColorPicker = DKColorWithRGB(0xEDF1F4, 0x000000);
    return cuttingLine;
}

@end
