//
//  Mp3ViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/4.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "Mp3ViewController.h"

@interface Mp3ViewController ()

@property(nonatomic,strong) AVAudioPlayer *avAudioPlayer;   //播放器player
@property(nonatomic,strong) UIProgressView *progressV;      //播放进度
@property(nonatomic,strong) UISlider *volumeSlider;         //声音控制
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation Mp3ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化三个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(100, 100, 60, 40)];
    [button setTitle:@"Play" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(100, 150, 60, 40)];
    [button1 setTitle:@"pause" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(100, 200, 60, 40)];
    [button2 setTitle:@"stop" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    //从budle路径下读取音频文件　　轻音乐 - 萨克斯回家 这个文件名是你的歌曲名字,mp3是你的音频格式
    NSString *string = [[NSBundle mainBundle] pathForResource:@"yese" ofType:@"mp3"];
    //把音频文件转换成url格式
    NSURL *url = [NSURL fileURLWithPath:string];
    //初始化音频类 并且添加播放文件
    _avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //设置代理
    _avAudioPlayer.delegate = self;
    
    //设置初始音量大小
    // avAudioPlayer.volume = 1;
    
    //设置音乐播放次数  -1为一直循环
    _avAudioPlayer.numberOfLoops = -1;
    
    //预播放
    [_avAudioPlayer prepareToPlay];
    
    //初始化一个播放进度条
    _progressV = [[UIProgressView alloc] initWithFrame:CGRectMake(20, 50, 200, 20)];
    [self.view addSubview:_progressV];

    
    //用NSTimer来监控音频播放进度
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                           selector:@selector(playProgress)
                                           userInfo:nil repeats:YES];
    //初始化音量控制
    _volumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 70, 200, 20)];
    [_volumeSlider addTarget:self action:@selector(volumeChange)
           forControlEvents:UIControlEventValueChanged];
    //设置最小音量
    _volumeSlider.minimumValue = 0.0f;
    //设置最大音量
    _volumeSlider.maximumValue = 10.0f;
    //初始化音量为多少
    _volumeSlider.value = 5.0f;
    
    [self.view addSubview:_volumeSlider];

    
    //声音开关控件(静音)
    UISwitch *swith = [[UISwitch alloc] initWithFrame:CGRectMake(100, 20, 60, 40)];
    [swith addTarget:self action:@selector(onOrOff:) forControlEvents:UIControlEventValueChanged];
    //默认状态为打开
    swith.on = YES;
    [self.view addSubview:swith];

}

//播放
- (void)play
{
    [_avAudioPlayer play];
}
//暂停
- (void)pause
{
    [_avAudioPlayer pause];
}
//停止
- (void)stop
{
    _avAudioPlayer.currentTime = 0;  //当前播放时间设置为0
    [_avAudioPlayer stop];
}
//播放进度条
- (void)playProgress
{
    //通过音频播放时长的百分比,给progressview进行赋值;
    _progressV.progress = _avAudioPlayer.currentTime/_avAudioPlayer.duration;
}
//声音开关(是否静音)
- (void)onOrOff:(UISwitch *)sender
{
    _avAudioPlayer.volume = sender.on;
}

//播放音量控制
- (void)volumeChange
{
    _avAudioPlayer.volume = _volumeSlider.value;
}

//播放完成时调用的方法  (代理里的方法),需要设置代理才可以调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [_timer invalidate]; //NSTimer暂停   invalidate  使...无效;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
