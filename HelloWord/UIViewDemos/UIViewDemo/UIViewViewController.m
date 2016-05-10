//
//  UIKitController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/16.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "UIViewViewController.h"

@interface UIViewViewController ()
@property (weak, nonatomic) IBOutlet UIView *withView;

@end

@implementation UIViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//修改父控件为红色
- (IBAction)changeFatherViewColor:(UIButton *)sender {
    UIView* fatherView = sender.superview;
    fatherView.backgroundColor = [UIColor redColor];
}
//修改父控件为随机颜色
-(IBAction)changeFatherColorRandom:(UIButton *)sender{
    UIView* fatherView = sender.superview;
    
    float randomR = arc4random_uniform(255)/255.0;
    float randomG = arc4random_uniform(255)/255.0;
    float randomB = arc4random_uniform(255)/255.0;
    
    UIColor* randomColor = [UIColor colorWithRed:randomR green:randomG blue:randomB alpha:1];
    fatherView.backgroundColor = randomColor;
}

//创建一个View出来并且添加到白色的View中；
- (IBAction)createView:(UIButton *)sender {
    
    UIView *createrView = [[UIView alloc] init];
    [self.withView addSubview:createrView];//为某一个控件添加子控件
    //使用代码设置代码的空间的位置
    createrView.frame=CGRectMake(20, 400, 100, 100);//设view的位置和大小
    createrView.backgroundColor = [UIColor purpleColor];
    
    NSLog(@"addView");
}


- (IBAction)createViewAndMove:(id)sender {
    //1、设置view的位置尺寸
    UIView* createView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    createView.backgroundColor = [UIColor redColor];
    [self.withView addSubview:createView];
    
    CGRect oldFrame = createView.frame;
    oldFrame.origin.x = 100;
    
    //首尾动画可以不提交
    /*//头尾是动画
     [UIView beginAnimations:nil context:nil];//开始动画
     [UIView setAnimationDuration:3];
     //    [UIView setAnimationDelay:2];
     
     createView.frame = oldFrame;
     
     [UIView commitAnimations];//提交动画*/
    
    
    //block动画  优先、更多选择使用block动画
    [UIView animateWithDuration:3 animations:^{
        createView.frame = oldFrame;
    }];
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
