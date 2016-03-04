//
//  DetialTableViewCell.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/4.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "DetialTableViewCell.h"

@implementation DetialTableViewCell

@synthesize pic;
@synthesize name;
@synthesize time;
@synthesize content;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
