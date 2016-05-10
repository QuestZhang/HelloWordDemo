//
//  DetialTableViewCell.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/4.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "DetialTableViewCell.h"

@implementation DetialTableViewCell

@synthesize pic;
@synthesize name;
@synthesize time;
@synthesize content;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat width = [[UIScreen mainScreen] bounds].size.width;
        CGFloat height = [[UIScreen mainScreen] bounds].size.height;
        pic = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        [self insertSubview:pic atIndex:0];
        
        name = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pic.frame)+10, 15, (width -CGRectGetMaxX(pic.frame))/2 ,  15)];
        name.numberOfLines = 1;
        name.font = [UIFont systemFontOfSize:12];
        name.textColor = UIColorFromRGB(0x333333);
        [self insertSubview:name atIndex:1];
        
        time = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pic.frame)+10, CGRectGetMaxY(name.frame)+10, (width -CGRectGetMaxX(pic.frame))/2 ,  10)];
        time.numberOfLines = 1;
        time.font = [UIFont systemFontOfSize:12];
        time.textColor = UIColorFromRGB(0x666666);
        [self insertSubview:time atIndex:2];
        
        content = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pic.frame)+10, CGRectGetMaxY(time.frame)+10, (width -CGRectGetMaxX(pic.frame))/2 ,  15)];
        content.numberOfLines = 0;
        content.font = [UIFont systemFontOfSize:13];
        [self insertSubview:content atIndex:3];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
