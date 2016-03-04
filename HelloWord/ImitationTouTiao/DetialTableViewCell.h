//
//  DetialTableViewCell.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/4.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetialTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pic;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end
