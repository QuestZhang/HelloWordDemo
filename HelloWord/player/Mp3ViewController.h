//
//  Mp3ViewController.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/4.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

/*#define mp3Url @"http://www.360yys.cn:8090/test/yese.mp3"*/
#define mp3Url @"http://www.it1224.com/interfaceapp/music/zgwydwd.mp3"

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

#import <MediaPlayer/MediaPlayer.h>

@interface Mp3ViewController : UIViewController<AVAudioPlayerDelegate,MPMediaPickerControllerDelegate>



@end
