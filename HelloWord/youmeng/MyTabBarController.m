//
//  MyTabBarControllerViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/24.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "MyTabBarController.h"
#import "ShareViewController.h"
#import "LoginViewController.h"
#import "NightController.h"
#import "TouTiaoDetailsController.h"
#import "DKNightVersion.h"
#import "Mp3ViewController.h"
#import "UISTableViewController.h"


@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    /*
     UITabBarController设置注意事项：
     初始化方法名必须与文件名相同
     bundle：nil
     */
    
    ShareViewController *share = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];
    share.title = @"分享";
    share.tabBarItem.image = [UIImage imageNamed:@"UMS_share"];
    
    LoginViewController *login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    login.title = @"登录";
    login.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    NightController *night = [[NightController alloc] initWithNibName:@"NightController" bundle:nil];
    night.title = @"夜白";
    night.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    TouTiaoDetailsController * toutiao = [[TouTiaoDetailsController alloc] initWithNibName:@"TouTiaoDetailsController" bundle:nil];
    toutiao.title = @"详情";
    toutiao.tabBarItem.image = [UIImage imageNamed:@"UMS_share"];
    
    Mp3ViewController *mp3 = [[Mp3ViewController alloc] init];
    mp3.title = @"音乐";
    mp3.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    UISTableViewController *uis = [[UISTableViewController alloc] init];
    uis.title = @"UI控件列表";
    uis.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    [self presentViewController:uis animated:YES completion:nil];
    
//    push -> popTo  presentV.. ->  dismis
    
    
    [self setViewControllers:[NSArray arrayWithObjects:uis,toutiao,login,night,share,nil]];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
   
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    for (UIViewController *viewController in self.viewControllers) {
        [viewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    }
}



@end
