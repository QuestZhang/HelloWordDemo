//
//  CGRectViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/5.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

/*
 得到关于CGRect的数据
 
 CGFloat CGRectGetMinX(CGRect rect);
 
 CGFloat CGRectGetMidX(CGRect rect);
 
 CGFloat CGRectGetMaxX(CGRect rect);
 
 CGFloat CGRectGetMinY(CGRect rect);
 
 CGFloat CGRectGetMidY(CGRect rect);
 
 CGFloat CGRectGetMaxY(CGRect rect);
 
 CGFloat CGRectGetWidth(CGRect rect);
 
 CGFloat CGRectGetHeight(CGRect rect);
 */

#import "CGRectViewController.h"

@interface CGRectViewController ()

@end

@implementation CGRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(self.view.frame.origin.x/3, 20, self.view.frame.size.width/3, 20)];
    CGRectGetMaxY(button.frame);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
