//
//  MYTwoViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/13.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "MYTwoViewController.h"
#import "NHAttentionViewCell.h"

@interface MYTwoViewController ()<UITableViewDataSource,UITableViewDelegate,NHAttentionViewDeletage>

@property(nonatomic,strong) NSMutableArray* data;

@property(nonatomic,strong) NHAttentionModel* model_0;
@property(nonatomic,strong) NHAttentionModel* model_1;
@property(nonatomic,strong) NHAttentionModel* model_2;

@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data_0;
@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data_1;
@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data_2;
@property(nonatomic,strong) UITableView* mineTable;

@end

@implementation MYTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.data_0 addObject:self.model_1];
    [self.data_0 addObject:self.model_2];
    [self.data_0 addObject:self.model_0];
    [self.data_1 addObject:self.model_1];
    [self.data_1 addObject:self.model_0];
    [self.data_1 addObject:self.model_1];
    [self.data_2 addObject:self.model_2];
    [self.data_2 addObject:self.model_0];
    [self.data_2 addObject:self.model_2];
    [self.data addObject:self.data_0];
    [self.data addObject:self.data_1];
    [self.data addObject:self.data_2];
    
    [self.view addSubview:self.mineTable];
    self.mineTable.dataSource = self;
    self.mineTable.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 238;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"identifier";
    NHAttentionViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NHAttentionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //cell的高度238
    cell.data = self.data[indexPath.row];
    cell.deletage = self;
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSMutableArray *)data{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}

-(NSMutableArray *)data_0{
    if (_data_0 == nil) {
        _data_0 = [NSMutableArray array];
    }
    return _data_0;
}

-(NSMutableArray *)data_1{
    if (_data_1 == nil) {
        _data_1 = [NSMutableArray array];
    }
    return _data_1;
}

-(NSMutableArray *)data_2{
    if (_data_2 == nil) {
        _data_2 = [NSMutableArray array];
    }
    return _data_2;
}

-(NHAttentionModel *)model_0{
    if (_model_0 == nil) {
        _model_0 = [[NHAttentionModel alloc] init];
        _model_0.title = @"快乐小苹果";
        _model_0.detailTitle = @"做最专业能手";
        _model_0.image = @"http://pic1.win4000.com/pic/b/9b/71f0732170.jpg";
        _model_0.button  = @"关注框";
        _model_0.buttonTitle = @"关注";
        _model_0.buttonTitleColor = 0xE22222;
        _model_0.otherData = @{@"zhang":@"1"};
    }
    return _model_0;
}

-(NHAttentionModel *)model_1{
    if (_model_1 == nil) {
        _model_1 = [[NHAttentionModel alloc] init];
        _model_1.title = @"快乐小香蕉";
        _model_1.detailTitle = @"做最专业操手";
        _model_1.image = @"http://a.hiphotos.baidu.com/image/pic/item/f9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg";
        _model_1.button  = @"关注框";
        _model_1.buttonTitle = @"关注";
        _model_1.buttonTitleColor = 0xE22222;
        _model_1.otherData = @{@"zhang":@"2"};
    }
    return _model_1;
}

-(NHAttentionModel *)model_2{
    if (_model_2 == nil) {
        _model_2 = [[NHAttentionModel alloc] init];
        _model_2.title = @"快乐小二B";
        _model_2.detailTitle = @"做最专业喜剧人";
        _model_2.image = @"http://h.hiphotos.baidu.com/image/pic/item/dbb44aed2e738bd4ec4f29e6a58b87d6267ff9ff.jpg";
        _model_2.button  = @"关注框";
        _model_2.buttonTitle = @"关注";
        _model_2.buttonTitleColor = 0xE22222;
        _model_2.otherData = @{@"zhang":@"3"};
    }
    return _model_2;
}

-(UITableView *)mineTable{
    if (_mineTable == nil) {
        _mineTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mineTable.rowHeight = 238;
    }
    return _mineTable;
}

//=============MyView Deletage===============

//更多按钮点击事件
-(void)onClickOfMore:(UIButton*)moreButton{
    NSLog(@"onClickOfMore");
}

//点解整个item 返回itemView 与返回Model同时执行
-(void)onClickOfItem:(NHAttentionItemView*)item{
    NSLog(@"onClickOfItem%ld",item.tag);
}

//点击这个item 返回Item的Model 与返回ItemView同时执行
-(void)onClickItemForModel:(NHAttentionModel *)model{
    NSLog(@"%@",model.description);
}

//点击关注按钮返回对应字典
-(void)onClickOfAttentionOtherData:(NSDictionary*)otherData{
    NSLog(@"%@",otherData.description);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
