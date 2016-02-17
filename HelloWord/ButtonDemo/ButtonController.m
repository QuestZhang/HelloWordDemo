//
//  ButtonController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/16.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "ButtonController.h"

@interface ButtonController ()

@end

@implementation ButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createButton:(UIButton*)sender {
    //创建UIButton
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置文字
    [btn setTitle:@"点击我试试" forState:UIControlStateNormal];
    //设置背景图片
    
    UIImage *image = [UIImage imageNamed:@"abc.jpg"];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    // 设置Frame
    btn.frame = CGRectMake(100, 0, 100, 100);
    
    //设置按钮颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //添加到控制器View上
    [self.view addSubview:btn];
    
    //为按钮添加事件，让点击按钮可以干事情
    [btn addTarget:self action:@selector(dongSomeThing) forControlEvents:UIControlEventTouchUpInside];
}

-(void)dongSomeThing{
    NSLog(@"点我干吗");
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
