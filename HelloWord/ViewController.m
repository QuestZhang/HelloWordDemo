//
//  ViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/14.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

/*
 代码都写在这里
 */

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *Label1;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender {
    static NSInteger count = 0;
    
    if (count%2 == 0) {
        self.Label1.text = @"HelloWord2";
    }else{
        self.Label1.text=[@"HelloWord" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)count]];
        [NSString stringWithFormat:@"HelloWord%ld",(long)count];
        NSLog(@"-----sd------%ld",[@"1" integerValue]+2);
    }
    
    count++;
    
    
}



@end
