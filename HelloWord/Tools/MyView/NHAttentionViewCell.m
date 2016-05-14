//
//  NHAttentionViewCellTableViewCell.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/12.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NHAttentionViewCell.h"
#import "DKNightVersion.h"

@interface NHAttentionViewCell()

@property(nonatomic,strong) NHAttentionView* attentionView;

@end

@implementation NHAttentionViewCell

@synthesize tags;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.frame = CGRectMake(0, 0, self.frame.size.width, 238);
        self.attentionView.tags = self.tags;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:[self cuttingLineWithY:0]];
    [self.attentionView setTitle:@"农红广场" image:@"农红秀场"];
    [self.attentionView setMoreTitle:@"更多" moreImage:@"更多"];
    [self addSubview:self.attentionView];
    [self addSubview:[self cuttingLineWithY:CGRectGetMaxY(self.attentionView.frame)+19]];
}

-(void)setTags:(NSMutableArray<NSString *> *)aTags{
    tags = [aTags copy];
    self.attentionView.tags = aTags;
}

-(NSMutableArray *)tags{
    if (tags == nil) {
        tags = [NSMutableArray array];
        [tags addObject:@"1"];
        [tags addObject:@"2"];
        [tags addObject:@"3"];
    }
    return tags;
}

-(NHAttentionView *)attentionView{
    if (_attentionView == nil) {
        _attentionView = [[NHAttentionView alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width, 200)];
    }
    return _attentionView;
}

-(void)setDeletage:(id<NHAttentionViewDeletage>)deletage{
    _deletage = deletage;
    self.attentionView.deletage = deletage;
}

-(void)setData:(NSMutableArray<NHAttentionModel *> *)data{
    _data = [data copy];
    self.attentionView.data = data;
    [self.attentionView execute];
}

-(UIView*)cuttingLineWithY:(CGFloat)y{
    UIView* cuttingLine = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.frame.size.width, 10)];
    cuttingLine.dk_backgroundColorPicker = DKColorWithRGB(0xEEEEEE,0x000000);
    return cuttingLine;
}

@end
