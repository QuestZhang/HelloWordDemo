//
//  ShareViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/24.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "ShareViewController.h"
#import "DKNightVersion.h"
#import "AppDelegate.h"





@interface ShareViewController ()
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.dk_backgroundColorPicker = DKColorWithColors([UIColor redColor], [UIColor blackColor]);
    [self.shareBtn dk_setTitleColorPicker:DKColorWithColors([UIColor whiteColor], [UIColor yellowColor]) forState:UIControlStateNormal];
//    [self presentViewController:self animated:YES completion:^{
//        
//    }];
//    [self popoverPresentationController];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController pushViewController:newVC animated:YES];
//    [self.navigationController popoverPresentationController];
//    [self.navigationController popToViewController:nsnfsdkf animated:YES];
//    [self.navigationController popViewControllerAnimated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButton:(id)sender {
    /*
     一分享就会横屏
     */
    
    //    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscape];
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UMengAppKey
                                      shareText:@"https://www.baidu.com"
                                     shareImage:nil
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToQzone,UMShareToQQ,UMShareToRenren,UMShareToWechatSession,UMShareToAlipaySession,nil]
                                       delegate:self];
    
    //    [UMSocialSnsService presentSnsIconSheetView:self
    //                                         appKey:UMengAppKey
    //                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
    //                                     shareImage:[UIImage imageNamed:@"icon"]
    //                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
    //                                       delegate:self];4.4.2  自定义分享样式
    
   /* //    使用自定义分享UI界面，则在对应的QQ分享按钮中实现下面的方法//平台数组：@[UMShareToQQ]
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:@"分享文字" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    */
    
    /*   //Qzone分享则替换平台参数为Qzone即可
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone] content:@"分享文字" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    
*/
    
    /*    QQ设置点击分享内容跳转链接调用下面的方法
    
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
    //    Qzone设置点击分享内容跳转链接替换平台参数名即可
    
    [UMSocialData defaultData].extConfig.qzoneData.url = @"http://baidu.com";
    
    [UMSocialData defaultData].extConfig.renrenData.url = @"";
    
    [UMSocialData defaultData].extConfig.*＊＊Data.###还有其它的
     */
    
//===========================
    
    /*   4.4.5  设置分享消息类型
     
     QQ分享消息类型分为图文、纯图片，QQ空间分享只支持图文分享（图片文字缺一不可）
     
     QQ分享消息默认为图文类型，设置纯图片类型方法为
     [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage;
     
     */
    
}

-(BOOL)isDirectShareInIconActionSheet{
    
    NSLog(@"=======================================================点了");
    return YES;
}

/**
 各个页面执行授权完成、分享完成、或者评论完成时的回调函数
 
 @param response 返回`UMSocialResponseEntity`对象，`UMSocialResponseEntity`里面的viewControllerType属性可以获得页面类型
 */
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
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
