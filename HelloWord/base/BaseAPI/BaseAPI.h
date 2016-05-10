//
//  BaseAPI.h
//  ZiXun_iOS
//
//  Created by PangTengFei on 16/3/5.
//  Copyright © 2016年 SYW. All rights reserved.
//

#ifndef BaseAPI_h
#define BaseAPI_h

#import "UIColor+extension.h"
#import "UIImageView+WebCache.h"
/**
 *     ScreenSize
 */
#pragma mark - ScreenSize -

#ifdef __IPHONE_9_0
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#else
#define SCREEN_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height
#define SCREEN_WIDTH  [[UIScreen mainScreen] applicationFrame].size.width
#endif

/**
 *     颜色
 */
#pragma mark - UIColorFromRGB -
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/**
 *     Debug及线上
 */
#pragma mark - Debug及线上 -
//打印
#ifdef DEBUG
#define DebugLog( fmt, ... ) NSLog( @"[%@:(%d)] %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(fmt), ##__VA_ARGS__] )

//#define BASEURLPATH   @"http://192.168.11.218:8080/flow_api" //测试张志伟的ip
#define BASEURLPATH   @"http://123.56.117.250:8083/flow_api" //正式环境
//#define BASEURLPATH   @"http://192.168.11.218:8180/flow_api" //头说用这个

//极光推送
//#define kJpushAppKey @"ff4bd9be17f7964de359ff68" //JPUSH appKey
//#define kJpushAppKey @"b1dc3ac8a7f1e09d56a26b5d"//张文强AppKey
#define kJpushAppKey @"eb9cdbfcee6c030883953556"//公司的AppKey
#define kJpushAPS_FOR_PRODUCTION @"0" //标识证书环境，0开发，1线上

#else
//打印
#define DebugLog( fmt, ... )
#define BASEURLPATH   @"http://123.56.117.250:8083/flow_api" //线上
#define kJpushAPS_FOR_PRODUCTION @"1" //标识证书环境，0开发，1线上
//极光推送
#define kJpushAppKey @"eb9cdbfcee6c030883953556"

#endif



/**
 *     Bundle
 */
#pragma mark - Bundle -
#define kBundle  [NSBundle mainBundle]


#define kVERSIONS [[[UIDevice currentDevice] systemVersion] floatValue]
#define REFRESHHEIGHT 40.0


/**
 *     极光推送 appKey见 Debug及线上 的 kJpushAppKey APS_FOR_PRODUCTION见Debug及线上 的kJpushAPS_FOR_PRODUCTION
 */
#define kJpushChannel @"Appstore"  //app下载渠道，为方便分渠道统计，可自行定义


#ifdef __OBJC__

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

#import <QuartzCore/QuartzCore.h>


//夜间模式
#import "DKNightVersion.h"
//define this constant if you want to use Masonry without the 'mas_' prefix

#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax

#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"
#import "UIView+position.h"
#import "UIColor+extension.h"
//#import "SYWRequestComm.h"
//#import "GetSizeTool.h"
//#import "UIView+GetCellFromContainerView.h"
#endif


//字体颜色
#define kBlackColor [UIColor blackColor]
#define kLightGrayColor [UIColor lightGrayColor]
#define kGrayColor [UIColor grayColor]
#define kRedColor [UIColor redColor]
//字数限制
#define MAXINPUT 2000
/**
 *     新闻列标相关
 */
//新闻标题字体大小
#define kTitleFontSize 18.0
//来源评论字体大小
#define kSourceFontSize 12.0
//到左右边界的距离
#define edgesDistance 15.0
//到上下边界的距离
#define topDistance 15.0
//title与Source之间的距离
#define kDistance 15.0
//删除键宽度
#define delWidth 20.0
//删除键高度
#define delHeight 15.0

//listBar相关
#define kStatusHeight 20.0
#define padding 20
#define itemPerLine 4
#define kItemW (SCREEN_WIDTH-padding*(itemPerLine+1))/itemPerLine
#define kItemH 25
#define kListBarH  45.0
#define kArrowW  45.0
#define kAnimationTime  0.8
typedef enum{
    topViewClick = 0,
    FromTopToTop = 1,
    FromTopToTopLast = 2,
    FromTopToBottomHead = 3,
    FromBottomToTopLast = 4
} animateType;

#pragma mark - 缓存相关 -
typedef enum{
    DataCacheStatusExpire = 0,  // 缓存过期
    DataCacheStatusVaild,      //  缓存有效
    DataCacheStatusNone,
}DataCatcheStatus;
#define PLocalEntityName @"NewsList"


#endif /* BaseAPI_h */
