//
//  NightController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/26.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "NightController.h"
#import "DKNightVersion.h"

@interface NightController ()

@end

@implementation NightController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.dk_backgroundColorPicker = DKColorWithColors([UIColor greenColor], [UIColor blackColor]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(UISwitch *)sender {
    
    if(sender.isOn && [DKNightVersionManager currentThemeVersion] == DKThemeVersionNight){
        [DKNightVersionManager dawnComing];
    }else{
        [DKNightVersionManager nightFalling];
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
