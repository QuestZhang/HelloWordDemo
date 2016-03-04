//
//  NineController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/17.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NineController.h"

#define kColumn 3
#define kTopY 5
#define imageViewWidth 45

@interface NineController ()

@property(nonatomic,strong )NSArray *dataArray;

@end

@implementation NineController

//懒加载数据,重写getter方法
-(NSArray*)dataArray{

    if(nil == _dataArray){
        //1、读取文件路径
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 2、读取文件内容到数组
        _dataArray = [NSArray arrayWithContentsOfFile:path];
        
        //取出数组中对应的字典
        
        
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGFloat margin = 30;
    CGFloat yellowWidth = 80;
    CGFloat yellowHeight = 95;
    CGFloat margin = (self.view.frame.size.width-kColumn*yellowWidth)/(kColumn+1);
    
    int colum = 3;
    int row = 4;
    
    for (int j = 0; j<row; j++) {//确定列数
        
        for (int i = 0; i < kColumn; i++ ) {//确定行数
            
            CGFloat yellowX = (i + 1)*margin + i*yellowWidth;
            CGFloat yellowY = (j + 1)*margin + j*yellowWidth;
            
            
            //添加一个View
            UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(yellowX, yellowY, yellowWidth, yellowHeight)];
            [yellowView setBackgroundColor:[UIColor yellowColor]];
            [self.view addSubview:yellowView];
            
            NSLog(@"9宫格");
            
            //内部子控件的添加
            
            //添加ImageView
            
            //确定宽高
            CGFloat imageViewX = (yellowWidth - imageViewWidth)/2;
            UIImageView * iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, kTopY, imageViewWidth, imageViewWidth)];
            
            [iconImageView setBackgroundColor:[UIColor redColor]];
            
            [yellowView addSubview:iconImageView];
            
            //添加Label
            
            //LabelY轴
            CGFloat labelY = CGRectGetMaxY(iconImageView.frame)+kTopY/2;//想获得最大Y值
            
            
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, labelY, yellowWidth, 15)];
             nameLabel.text = @"爸爸去";
            nameLabel.textAlignment = NSTextAlignmentCenter;
            
            [yellowView addSubview:nameLabel];
            
            
            //设置字体
            nameLabel.font = [UIFont systemFontOfSize:15]; //经常使用
            [UIFont boldSystemFontOfSize:15];//粗体
            [UIFont italicSystemFontOfSize:15];//斜体(对中文不支持)
            
            //添加button
            
            CGFloat buttonWidth = imageViewWidth + 10;
            CGFloat buttonHeight = 20;
            
            CGFloat buttonX = (yellowWidth - buttonWidth)/2;
            CGFloat buttonY = CGRectGetMaxY(nameLabel.frame)+kTopY/2;
            
            UIButton * downloadButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX , buttonY, buttonWidth, buttonHeight)];
            
            //设置button属性
            //背景图片
            
            //设置background image ，image， title 一定要分状态设置
            /*
             默认、高亮、被选中、被禁用
             */
            
            [downloadButton setBackgroundColor:[UIColor redColor]];
            
            //文字
            [downloadButton setTitle:@"下载" forState:UIControlStateNormal];
            
            [yellowView addSubview:downloadButton];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
