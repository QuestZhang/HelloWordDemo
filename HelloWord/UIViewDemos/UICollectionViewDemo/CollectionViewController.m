//
//  CollectionViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/9.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "CollectionViewController.h"
#import "NHSquareCell.h"

static  NSString* NHSquareCellIdentifier = @"identifier_cell_item";

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,strong) NSMutableArray* array;
@property(nonatomic,strong) UICollectionView* collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[NHSquareCell class] forCellWithReuseIdentifier:NHSquareCellIdentifier];
    [self.view addSubview:self.collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NHSquareCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NHSquareCellIdentifier forIndexPath:indexPath];
    cell.title = @"快乐小萍";
    cell.detailTitle = @"做最专业的能手";
    cell.image = @"http://pic1.win4000.com/pic/b/9b/71f0732170.jpg";
    cell.tag = indexPath.row+1;
    [cell.attention setTitle:@"关注" forState:UIControlStateNormal];
    [cell.attention addTarget:self action:@selector(attention:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"CollectionViewOnClick");
}

-(void)attention:(UIButton*) button{
    NSLog(@"%@",@(button.tag));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSMutableArray*)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}

-(UICollectionView*)collectionView{
    if (_collectionView == nil) {
        CGRect frame = CGRectMake(0, 0, self.width, self.width/3*2);
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        [flowLayout setItemSize:CGSizeMake(self.width/3, self.width/3*2)];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsZero;
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(CGFloat)width{
    if (_width == 0) {
        return self.view.frame.size.width;
    }
    return _width;
}

-(CGFloat)height{
    if(_height == 0){
        return self.view.frame.size.height;
    }
    return _height;
}

@end
