//
//  CalcController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/16.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "CalcController.h"

@interface CalcController ()

@property(nonatomic,weak)IBOutlet UITextField* field1;

@property(nonatomic,weak)IBOutlet UITextField* field2;

@property (weak, nonatomic) IBOutlet UILabel *sumLabel;

-(IBAction)doSum:(id)sender;

@end

@implementation CalcController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doSum:(id)sender;{
    NSLog(@"ddddd");
    NSLog(@"%@",self.field1.text);
    int num1 = [self.field1.text intValue];
    int num2 = [self.field2.text intValue];
    double num3 = [self.field1.text doubleValue];
    
    int sum = num1 + num2;
    
    self.sumLabel.text = [NSString stringWithFormat:@"%d",sum];
    //方式一：取消键盘
//    [self.field1 resignFirstResponder];//取消第一响应者
//    [self.field2 resignFirstResponder];
    //方式二：取消键盘
    [self.view endEditing:YES];//取消所有View的编辑
    
    
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
