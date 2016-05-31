//
//  BaseViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/4/28.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)width{
    if (_width == 0) {
        _width = [UIScreen mainScreen].bounds.size.width;
    }
    return _width;
}

-(CGFloat)height{
    if (_height == 0) {
        _height = [UIScreen mainScreen].bounds.size.height;
    }
    return _height;
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
