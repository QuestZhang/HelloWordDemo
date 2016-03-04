//
//  DetialTabView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/3.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "DetialTabView.h"
#import "DetialTableViewCell.h"
#import "DetialEntity.h"

@implementation DetialTabView

@synthesize data;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.data = [NSMutableArray arrayWithCapacity:1];
        self.dataSource = self;
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";//Android tag
    DetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];//设置tag
    if (cell == nil) {  //cell相当于Android的convertView
        cell = [[DetialTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    DetialEntity *entity = (DetialEntity *)self.data[[indexPath row]];
    [cell.pic setImage:[UIImage imageNamed:entity.imageUrl]];
    [cell.name setText:entity.name];
    [cell.time setText:entity.time];
    [cell.content setText:entity.content];
    
    return cell;
}

@end
