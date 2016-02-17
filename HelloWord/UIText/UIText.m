//
//  TestVC.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/14.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "UIText.h"



@interface UIText()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textFieldd;

@property (weak, nonatomic) IBOutlet UITextView *textView;

-(void)keyboardDidHide:(NSNotification*)notif;

-(void)keyboardDidShow:(NSNotification*)notif;

@end

@implementation UIText

//通过委托来放弃第一相应者
#pragma mark -UITextField Delegate Method
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    
    //注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [super viewWillDisappear:animated];

}

-(void)viewWillDisappear:(BOOL)animated{
    
    //解锁键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    
    //解说键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
    [super viewWillDisappear:animated];

}
-(void)keyboardDidHide:(NSNotification*)notif{
    NSLog(@"键盘关闭");
}

-(void)keyboardDidShow:(NSNotification*)notif{
    NSLog(@"键盘打开");
}

@end
