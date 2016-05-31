//
//  ImageCell.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageCell

- (void)awakeFromNib {
    self.imageView.layer.borderWidth = 0;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.cornerRadius = 50;
    self.imageView.frame = CGRectMake(0, 0, 50, 50);
    self.imageView.center = self.center;
    [self.imageView.layer masksToBounds];
}

- (void)setImage:(NSString *)image{
    _image = [image copy];
    
    if ([image hasPrefix:@"http://"] || [image hasPrefix:@"https://"]) {
        NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:image]];
        if (imageData != nil) {
            self.imageView.image = [UIImage imageWithData:imageData];
        }else{
            self.imageView.image = [UIImage imageNamed:@"AppIcon"];
        }
    }else{
        self.imageView.image = [UIImage imageNamed:@"AppIcon"];
    }
}

- (CGFloat)cornerRadius{
    if (_cornerRadius != 0) {
        return _cornerRadius;
    }
    return 50;
}

@end
