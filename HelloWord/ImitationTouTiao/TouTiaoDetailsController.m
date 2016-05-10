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

@synthesize bottomView;
@synthesize tableView;
@synthesize data;

-(void)loadView{
    [super loadView];
}

-(void)reloadInputViews{
    [super reloadInputViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, height-97, width, 48)];
    bottomView.backgroundColor = UIColorFromRGB(0xF4F5F6);
    bottomView.bottomViewDelegate = self;
    
    CGFloat tableViewY = CGRectGetMinY(bottomView.frame);
    CGFloat maxY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    tableView = [[DetialTabView alloc] initWithFrame:CGRectMake(0, maxY, width, tableViewY)];
    tableView.rowHeight = 100;
    data = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i =0; i<100; i++) {
        [self initData:i];
    }
//    [tableView.data insertObjects:data atIndexes:[NSIndexSet indexSetWithIndex:1]];
    //    tableView.data;
    
    [self.view addSubview:bottomView];
    [self.view addSubview:tableView];
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
    [tableView.data addObject:entity];
}

- (void)setNavigationbar{
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:self];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 44)];
    
    //nav.tintColor = [UIColor grayColor];
    
    //创建UINavigationItem
    
    UINavigationItem * navigationBarTitle = [[UINavigationItem alloc] initWithTitle:@"创建UINavigationBar"];
    
    //[nav pushNavigationItem:navigationBarTitle animated:YES];
    
    [self.view addSubview: navigationBar];
    
    //创建UIBarButton 可根据需要选择适合自己的样式
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(navigationBackButton:)];
    
    //设置barbutton
    navigationBarTitle.leftBarButtonItem = item;
    
    [navigationBar setItems:[NSArray arrayWithObject: navigationBarTitle]];
    
    
    
}

@end
