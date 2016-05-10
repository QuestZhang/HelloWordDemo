//
//  UISTableTableViewController.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/8.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef enum{
    
    UILabelType,
    UIBtnType,
    UITextViewType,
    UITextFildType,
    UIViewViewType,
    UISwitchType,
    UIWebViewType
    
}UIViewType;

@interface UISTableViewController : UITableViewController

@end
