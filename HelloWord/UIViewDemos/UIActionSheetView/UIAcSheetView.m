//
//  UIActionSheetView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/23.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#define kPushTime 0.5
#define kDismissTime 0.3

#define kMargin 1//间隙高度

#import "UIAcSheetView.h"

@interface UIAcSheetView(){
    CGFloat width;
    CGFloat height;
}

@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) UIButton *bgButton;
@property(nonatomic,strong) UIButton *cancelButton;

@end


@implementation UIAcSheetView

- (instancetype)initSheetWithCustomView:(UIView *)customView{
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        
        //****半透明背景按钮（背景View）
        self.bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.bgButton.frame = [UIScreen mainScreen].bounds;
        self.bgButton.backgroundColor = [UIColor blackColor];
        self.bgButton.alpha = 0.35;
        [self.bgButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.bgButton];
        
        //*****title和sheetView的容器View（除了取消按钮显示的View）
        self.contentView = [[UIView alloc] init];
        if (customView != nil) {
            self.contentView = customView;
        }
        self.contentView.backgroundColor = [UIColor colorWithWhite:0xF0F0F0 alpha:1];
        [self addSubview:self.contentView];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(0, height-45, width, 45);
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        self.cancelButton.layer.masksToBounds = YES;
        self.cancelButton.backgroundColor = [UIColor colorWithWhite:0xF5F5F5 alpha:1];
        self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.cancelButton setTitleColor:[UIColor colorWithWhite:0x000000 alpha:1] forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
    }
    
    return self;

}

//取消弹出
-(void) dismiss{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:kDismissTime animations:^{
        weakSelf.contentView.frame = CGRectMake(0, height, width, 0);
        weakSelf.cancelButton.frame = CGRectMake(0, height, width, 0);
        weakSelf.bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        [weakSelf.contentView removeFromSuperview];
        [weakSelf.cancelButton removeFromSuperview];
        [weakSelf.bgButton removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];


}

//显示弹出
-(void) show{
    __weak typeof(self) weakSelf = self;
//
     [UIView setAnimationsEnabled:NO];
    [UIView animateWithDuration:kPushTime animations:^{
        weakSelf.contentView.frame = CGRectMake(0, height-width/2-45, width, width/2+45);
        weakSelf.cancelButton.frame = CGRectMake(0, height-45, width, 45);

        weakSelf.bgButton.alpha = 0.35;
    }];

}

@end
