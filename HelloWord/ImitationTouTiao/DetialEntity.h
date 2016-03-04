//
//  DetialEntity.h
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/3.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetialEntity : NSObject

@property(nonatomic,retain) NSString *imageUrl;//评论人头像地址

@property(nonatomic,retain) NSString *name;//评论人昵称

@property(nonatomic,retain) NSString *time;//评论时间

@property(nonatomic,retain) NSString *praiseNumber;//大母子个数

@property(nonatomic,retain) NSString *commentNumber;//评论个数

@property(nonatomic,retain) NSString *content;//评论内容

@end
