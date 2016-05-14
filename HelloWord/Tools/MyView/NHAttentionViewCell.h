//
//  NHAttentionViewCellTableViewCell.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/12.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHAttentionView.h"

@interface NHAttentionViewCell : UITableViewCell

@property(nonatomic,weak) id<NHAttentionViewDeletage> deletage;

@property(nonatomic,strong) NSMutableArray<NSString*>* tags;
@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
