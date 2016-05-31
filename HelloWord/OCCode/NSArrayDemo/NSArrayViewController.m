//
//  NSArrayViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/31.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NSArrayViewController.h"

@interface NSArrayViewController()

@property(nonatomic,strong) NSArray* salary;
@property(nonatomic,strong) UIButton* exectue;

@end

@implementation NSArrayViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.exectue];
    [self.exectue addTarget:self action:@selector(didAddToSalary:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)didAddToSalary:(UIButton*)button{
    [self.salary makeObjectsPerformSelector:@selector(addToSalary:) withObject:[NSDecimalNumber numberWithInt:20]];
    //[self.salary makeObjectsPerformSelector:@selector(addToSalary)];
}

-(void)addToSalary:(NSDecimalNumber*)inRaise{
    NSLog(@"%@",inRaise);
}

-(void)addToSalary{
    NSLog(@"%@",@"inRaise");
}


-(NSArray *)salary{
    if (_salary == nil) {
        _salary = @[@1,@2,@3,@4,@5];
    }
    return _salary;
}

-(UIButton *)exectue{
    if (_exectue == nil) {
        CGRect frame = CGRectMake(0, 0, self.width/5, self.width/5/2);
        _exectue = [UIButton buttonWithType:UIButtonTypeCustom];
        _exectue.frame = frame;
        _exectue.center = CGPointMake(self.width/2, 10);
        [_exectue setTitle:@"makeObjectsPerformSelector" forState:UIControlStateNormal];
        _exectue.layer.masksToBounds = YES;
        _exectue.layer.borderWidth = 2.0;
        _exectue.layer.borderColor = [UIColor hexStringToColor:@"333333"].CGColor;
    }
    return _exectue;
}

@end
