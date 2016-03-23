//
//  UIActionSheetView.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/23.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAcSheetView : UIView

- (id)initSheetWithCustomView:(UIView *)customView;

-(void) show;

-(void) dismiss;

@end
