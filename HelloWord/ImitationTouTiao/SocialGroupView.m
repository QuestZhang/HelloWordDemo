//
//  SocialGroupView.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/2.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "SocialGroupView.h"

@interface SocialGroupView()//社会化按钮组

@property(strong,nonatomic) NSMutableDictionary *btnSocialDict;

@property(strong,nonatomic) NSMutableArray *btnSocials;

@end

@implementation SocialGroupView

-(instancetype)initWithFrame:(CGRect)frame{
    _btnSocialDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"v1",@"k1",nil];
    NSLog(@"btn.count is %ld",_btnSocialDict.count);
    [_btnSocialDict removeAllObjects];
     NSLog(@"btn.count is %ld",_btnSocialDict.count);
    
    _btnSocials = [NSMutableArray arrayWithCapacity:10];
    return [super initWithFrame:frame];
    
}

-(void)addButton:(UIButton *)btn source:(NSString *) imageName{
    if (btn != nil && imageName != nil) {
        [_btnSocialDict setValue:btn forKey:imageName];
    }
}

- (void) layoutChildView{
    NSUInteger len = _btnSocialDict.count;
    if (len == 0) {
        return;
    }
    
    CGFloat startLoc = self.frame.size.width/len;
    
    int index = 0;
    
    for (NSString *imageName in _btnSocialDict) {
        UIButton  *btn = _btnSocialDict[imageName];
        btn.frame = CGRectMake(index * startLoc + (startLoc-24)/2, 0, 24, 24);
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//        CGRect rect = btn.imageView.bounds;
//        CGFloat imageWidth = rect.size.width;
//        btn.frame = CGRectMake(index * startLoc+(startLoc-imageWidth)/4, 0, 30, 30);
        [self addSubview:btn];
        index ++;
    }
}


@end
