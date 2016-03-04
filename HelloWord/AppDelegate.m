//
//  AppDelegate.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/14.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialAlipayShareHandler.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //设置友盟Appkey
    [UMSocialData setAppKey:UMengAppKey];
    
    //打开调试log的开关
    [UMSocialData openLog:YES];
    
    //设置一个window start
    
    //设置分享到QQ/Qzone的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:@"1104804689" appKey:@"4LBP8XqYubhktn9B" url:@"http://www.umeng.com/social"];
    //设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];
    
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"4164054978"
                                              secret:@"ff4a1f0d0a33a987d56ddcda63f27351"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wxdc1e388c3822c80b" appSecret:@"a393c1527aaccb95f3a4c88d6d1455f6" url:@"http://www.umeng.com/social"];

    
    //分享到支付宝朋友圈
    [UMSocialAlipayShareHandler setAlipayShareAppId:@"2015111700822536"];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MyTabBarController *myTabBar = [[MyTabBarController alloc] init];
    self.window.rootViewController = myTabBar;
    
    // end
    
    return YES;
}

/*
 4.3.3  添加系统回调
 
 在APPdelegate中实现下面的方法
 */

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
