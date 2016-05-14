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
#import "UIText.h"
#import "WebViewController.h"
#import "GallerViewController.h"
#import "GalleryViewController.h"
#import "CollectionViewController.h"
#import "MYViewController.h"
#import "MYTwoViewController.h"

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
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    ShareViewController *share = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];
    share.title = @"分享";
    share.tabBarItem.image = [UIImage imageNamed:@"UMS_share"];
    
    LoginViewController *login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    login.title = @"登录";
    login.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    NightController *night = [[NightController alloc] initWithNibName:@"NightController" bundle:nil];
    night.title = @"夜白";
    night.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    TouTiaoDetailsController * toutiao = [[TouTiaoDetailsController alloc] init];
    toutiao.title = @"详情";
    toutiao.tabBarItem.image = [UIImage imageNamed:@"UMS_share"];
    
    Mp3ViewController *mp3 = [[Mp3ViewController alloc] init];
    mp3.title = @"音乐";
    mp3.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    UISTableViewController *uis = [[UISTableViewController alloc] init];
    uis.title = @"UI控件列表";
    uis.tabBarItem.image = [UIImage imageNamed:@"UMS_account"];
    
    UIText *uiText = [[UIText alloc] initWithNibName:@"UIText" bundle:nil];
    [uiText setTitle:@"Text"];
    [uiText.tabBarItem setImage:[UIImage imageNamed:@"UMS_account"]];
    
    WebViewController* webView = [[WebViewController alloc] init];
    [webView setTitle:@"UIWebView"];
    [webView.tabBarItem setImage:[UIImage imageNamed:@"UMS_share"]];
    
    GallerViewController* gallerView = [[GallerViewController alloc] init];
    [gallerView setTitle:@"画廊"];
    [gallerView.tabBarItem setImage:[UIImage imageNamed:@"UMS_account"]];
    
    GalleryViewController* galleryView = [[GalleryViewController alloc] init];
    [galleryView setTitle:@"画廊2"];
    [galleryView.tabBarItem setImage:[UIImage imageNamed:@"UMS_account"]];
    
    CollectionViewController* collection = [[CollectionViewController alloc] init];
    [collection setTitle:@"collection"];
    [collection.tabBarItem setImage:[UIImage imageNamed:@"UMS_account"]];
    
    MYViewController* myview = [[MYViewController alloc] init];
    [myview setTitle:@"myview"];
    [myview.tabBarItem setImage:[UIImage imageNamed:@"UMS_account"]];
    
    
    MYTwoViewController* myTwoview = [[MYTwoViewController alloc] init];
    [myTwoview setTitle:@"myTowview"];
    [myTwoview.tabBarItem setImage:[UIImage imageNamed:@"UMS_account"]];
    
//    [self presentViewController:uis animated:YES completion:nil];
//    self showDetailViewController: sender:<#(nullable id)#>
    
//    push -> popTo  presentV.. ->  dismis
    
    
    [self setViewControllers:[NSArray arrayWithObjects:myTwoview,toutiao,login,night,share,nil]];
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
