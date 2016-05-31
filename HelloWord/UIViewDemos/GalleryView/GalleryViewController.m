//
//  GalleryViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "GalleryViewController.h"

#import "ImageCell.h"
#import "LineLayout.h"

@interface GalleryViewController()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation GalleryViewController

static NSString *const ID = @"image";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self.view addSubview:self.collectionView];
}

//加载图片数据
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

/*//点击其他地方边宫格图
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[LineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[LineLayout alloc] init] animated:YES];
    }
}*/

#pragma mark -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    cell.image = self.images[indexPath.item];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(LineLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0) {
//        return CGSizeMake(100, 100);
//    }else if(indexPath.row == 1){
//        return CGSizeMake(100, 100);
//    }else{
//        return CGSizeMake(50, 50);
//    }
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // 删除模型数据
    [self.images removeObjectAtIndex:indexPath.item];
    // 删UI(刷新UI)
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

- (NSMutableArray *)images{
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    return _images;       
}

-(UICollectionView*)collectionView{
    if (_collectionView == nil) {
        CGRect frame = CGRectMake(0, 0, self.width, 100);
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:[[LineLayout alloc] init]];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

-(CGFloat)width{
    return self.view.frame.size.width;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//滑动TableView的scrollView
}

@end
