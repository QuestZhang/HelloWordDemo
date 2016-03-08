//
//  DetialEntity.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/3.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "DetialEntity.h"

@implementation DetialEntity

@synthesize imageUrl;//评论人头像地址

@synthesize name;//评论人昵称

@synthesize time;//评论时间

@synthesize praiseNumber;//大母子个数

@synthesize commentNumber;//评论个数

@synthesize content;//评论内容

-(NSString *)description{

    return [NSString stringWithFormat:@"评论人头像地址:%@\n,评论人昵称:%@\n,评论时间:%@\n,大母子个数:%@\n,评论个数:%@\n,评论内容:%@",imageUrl,name,time,praiseNumber,commentNumber,content];
}


@end
