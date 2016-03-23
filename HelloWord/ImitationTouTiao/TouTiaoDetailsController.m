//
//  TouTiaoDetailsController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/2/29.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "DKNightVersion.h"

#import "TouTiaoDetailsController.h"

#import "DetialTabView.h"

#import "DetialEntity.h"

#import "UIAcSheetView.h"

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface TouTiaoDetailsController ()

@property(strong,nonatomic) BottomView *bottomView;

@property(nonatomic,strong) DetialTabView *tableView;

@property(nonatomic,strong) NSMutableArray *data;

-(void) initData:(NSUInteger) count;

@end

@implementation TouTiaoDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    _bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, height-97, width, 48)];
    _bottomView.backgroundColor = UIColorFromRGB(0xF4F5F6);
    _bottomView.bottomViewDelegate = self;
    
    CGFloat tableViewY = CGRectGetMinY(_bottomView.frame);
    
    _tableView = [[DetialTabView alloc] initWithFrame:CGRectMake(0, 0, width, tableViewY)];
    _tableView.rowHeight = 100;
    _data = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i =0; i<20; i++) {
        [self initData:i];
    }
//    [_tableView.data insertObjects:_data atIndexes:[NSIndexSet indexSetWithIndex:1]];
    //    _tableView.data;
    
    [self.view addSubview:_bottomView];
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClickWritComment{
    NSLog(@"写评论。。。");
    UIAcSheetView *actionSheet = [[UIAcSheetView  alloc] initSheetWithCustomView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)]];
    [actionSheet show];
}

-(void)onClickShowComment{
    NSLog(@"显示评论。。。");
    
}

-(void)onClickFavorites{
    NSLog(@"收藏。。。");
    
}

-(void)onClickSharePlateFrom{
    NSLog(@"分享平台。。。");
    
}


-(void) initData:(NSUInteger) count{
    DetialEntity *entity = [[DetialEntity alloc] init];
    [entity setImageUrl:@"normal"];
    [entity setName:[NSString stringWithFormat:@"张文强%ld",count]];
    [entity setTime:@"一小时前"];
    [entity setContent:@"朝鲜真是作死"];
    [_tableView.data addObject:entity];
}

@end
