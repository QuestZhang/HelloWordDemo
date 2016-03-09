//
//  UISwitchViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/15.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "UISwitchViewController.h"

@interface UISwitchViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *upSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *downSwitch;

@property (weak, nonatomic) IBOutlet UILabel *SliderValue;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation UISwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _slider.minimumValue = 0.0f;
    _slider.maximumValue = 100.0f;
    [_slider setValue:0.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchValueChanged:(id)sender {
    
    UISwitch *witchSwitch = (UISwitch*)sender;
    BOOL setting = witchSwitch.isOn;
    [self.upSwitch setOn:setting animated:YES];
    [self.downSwitch setOn:setting animated:YES];
}

- (IBAction)sliderValueChange:(id)sender {
    
    UISlider* slider = (UISlider*)sender;
    int progressAsInt = (int) (slider.value);
    NSString* newText = [[NSString alloc] initWithFormat:@"%d",progressAsInt ];
    self.SliderValue.text = newText;
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
