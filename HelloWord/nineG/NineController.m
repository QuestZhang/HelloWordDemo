//
//  NineController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/17.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NineController.h"

#define kColumn 3

@interface NineController ()

@end

@implementation NineController

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
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
