//
//  DetialShowCountView.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/3.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetialShowCountViewDelegate <NSObject>

- (void) onAction:(UIView *) view;

@end

@interface DetialShowCountView : UIView

@property(nonatomic,weak) id<DetialShowCountViewDelegate> deletage;

- (void) setImageViewForImage:(UIImage *) image;

- (void) setLableWithString:(NSString *) stringCount;

@end
