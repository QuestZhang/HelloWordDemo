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
        self.data = [NSMutableArray arrayWithCapacity:0];
        self.dataSource = self;
    }
    return self;
}

//表示在这个块里的行的数量
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

//表示在这TableView里的块数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cellIdentifier";//Android tag
    DetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];//设置tag
    if (cell == nil) {  //cell相当于Android的convertView
        cell = [[DetialTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //cell.textLabel.numberOfLines = 0;
        
        // 这种方式，将会查找响应的xib文件，将不会调用initWithStyle方法
        //loadNibNamed:相当于android的LayoutInflater.inflate(int LayoutId);
        //NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:nil options:nil];
        //cell = [array objectAtIndex:0];
    }
    
    DetialEntity *entity = (DetialEntity *)self.data[[indexPath row]];
    [cell.pic setImage:[UIImage imageNamed:entity.imageUrl]];
    [cell.name setText:entity.name];
    [cell.time setText:entity.time];
    [cell.content setText:entity.content];
    //[cell.textLabel setText:entity.description];
    
    return cell;
}

@end
