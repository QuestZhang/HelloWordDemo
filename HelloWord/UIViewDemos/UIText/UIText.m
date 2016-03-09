//
//  UIText.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "UIText.h"

@interface UIText ()

@property (weak, nonatomic) IBOutlet UITextField *tfName;

@property (weak, nonatomic) IBOutlet UITextField *tfAbstruct;

@property (weak, nonatomic) IBOutlet UITextView *tvInput;

@property (weak, nonatomic) IBOutlet UISwitch *jump;

-(void) keyboardDidHide:(NSNotification*) notif;
-(void) keyboardDidShow:(NSNotification*) notif;

@end

@implementation UIText

//通过委托来放弃第一相应者 点击return按钮关闭键盘
#pragma mark -UITextField Delegate Method
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_tfName resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

//在即将出现View是注册通知
-(void)viewWillAppear:(BOOL)animated{

    //注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [super viewWillAppear:animated];
}

//在即将消失时取消通知
-(void)viewWillDisappear:(BOOL)animated{
    //解锁键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    
    //解说键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
    [super viewWillDisappear:animated];

}


-(void)keyboardDidHide:(NSNotification *)notif{
    NSLog(@"键盘关闭");
}

-(void)keyboardDidShow:(NSNotification *)notif{
    NSLog(@"键盘打开");
}

- (IBAction)jumpViewController:(id)sender {
    
    UISwitch *jumpSwitch = (UISwitch *)sender;
    if(jumpSwitch.isOn){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        return;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [_jump setOn:NO];//初始化UISwitch
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
