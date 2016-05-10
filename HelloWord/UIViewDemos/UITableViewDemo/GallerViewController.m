//
//  GallerViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "GallerViewController.h"

@interface GallerViewController()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,strong) UITableView* gallerView;
@property(nonatomic,strong) NSMutableArray* images;

@end

@implementation GallerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.gallerView];
    [self initData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.gallerView reloadData];
}

-(void)initData{
    [self.images addObject:@"http://a.hiphotos.baidu.com/image/pic/item/f9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg"];
    [self.images addObject:@"http://h.hiphotos.baidu.com/image/pic/item/dbb44aed2e738bd4ec4f29e6a58b87d6267ff9ff.jpg"];
    [self.images addObject:@"http://e.hiphotos.baidu.com/image/pic/item/f7246b600c338744e7162094550fd9f9d62aa002.jpg"];
    [self.images addObject:@"http://h.hiphotos.baidu.com/image/pic/item/279759ee3d6d55fb451579ce69224f4a21a4dd03.jpg"];
    [self.images addObject:@"http://e.hiphotos.baidu.com/image/pic/item/8cb1cb134954092359d94e479758d109b3de4952.jpg"];
    [self.images addObject:@"http://h.hiphotos.baidu.com/image/pic/item/d50735fae6cd7b8959dc17ba0a2442a7d9330e52.jpg"];
    [self.images addObject:@"http://pic1.win4000.com/pic/b/9b/71f0732170.jpg"];
    [self.images addObject:@"http://b.hiphotos.baidu.com/image/pic/item/023b5bb5c9ea15cec72cb6d6b2003af33b87b22b.jpg"];
    [self.images addObject:@"http://d.hiphotos.baidu.com/image/pic/item/9f2f070828381f305a5bdb76ad014c086f06f0ab.jpg"];
    [self.images addObject:@"http://g.hiphotos.baidu.com/image/pic/item/6c224f4a20a446230761b9b79c22720e0df3d7bf.jpg"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"indetifier_cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    UIImageView* imageView = nil;
    if ([cell viewWithTag:indexPath.row + 1]) {
        imageView = (UIImageView*)[cell viewWithTag:indexPath.row + 1];
    }else{
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        imageView.tag = indexPath.row + 1;
        [cell addSubview:imageView];
    }
    imageView.center = cell.center;
    
//    tableView.separatorColor = [UIColor clearColor];
    
    imageView.transform = CGAffineTransformMakeRotation(M_PI/2);
    NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.images[indexPath.row]]];
    if (imageView != nil) {
        UIImage* image = [UIImage imageWithData:imageData];
        [imageView setImage:image];
    }else{
        imageView.image = [UIImage imageNamed:@"UMS_account"];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(CGFloat)width{
    return [UIScreen mainScreen].bounds.size.width;
}

-(CGFloat)height{
    return [UIScreen mainScreen].bounds.size.height;
}

-(UITableView*)gallerView{
    if (_gallerView == nil) {
        _gallerView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 60, self.height) style:UITableViewStylePlain];
        _gallerView.transform = CGAffineTransformMakeRotation(M_PI/-2); //旋转滑动方向
        _gallerView.dataSource = self;
        _gallerView.delegate = self;
        _gallerView.tableFooterView = [[UIView alloc] init];
    }
    return _gallerView;
}

-(NSMutableArray*)images{
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    return _images;
}

@end
