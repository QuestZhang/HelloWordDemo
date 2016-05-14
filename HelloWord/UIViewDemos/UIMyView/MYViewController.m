//
//  MYViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "MYViewController.h"
#import "NHAttentionView.h"
#import "RecommendNHView.h"

@interface MYViewController ()<NHAttentionViewDeletage,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray<NSString*>* tags;
@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data;

@property(nonatomic,strong) NHAttentionModel* model_0;
@property(nonatomic,strong) NHAttentionModel* model_1;
@property(nonatomic,strong) NHAttentionModel* model_2;

@property(nonatomic,strong) NHAttentionView* attentionView;

@property(nonatomic,strong) UIButton* reflush;

//================MyView2============
@property(nonatomic,strong) RecommendNHView* recommendView;

@end

@implementation MYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.attentionView.tags = self.tags;
    self.attentionView.data = self.data;
    [self.attentionView setTitle:@"农红广场" image:@"农红秀场"];
    [self.attentionView setMoreTitle:@"更多" moreImage:@"更多"];
    [self.attentionView execute];
    [self.view addSubview:self.attentionView];
    [self.view addSubview:self.reflush];
    
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    NHAttentionItemView* itemView = [[NHAttentionItemView alloc] initWithFrame:CGRectMake(0, 0, width/3, 200)];
//    NHAttentionModel* model = self.data[0];
//    itemView.title = model.title;
//    itemView.detailTitle = model.detailTitle;
//    itemView.image = model.image;
//    itemView.buttonBackgroundImage = model.button;
//    [self.view addSubview:itemView];
    
//    [self.view addSubview:self.recommendView];
//    [self.recommendView setTitle:@"推荐农红"];
//    [self.recommendView setNickname:@"最炫芒果"];
//    [self.recommendView setNicknameDescription:@"芒果达人  石榴专家"];
//    [self.recommendView setRecommendReason:@"牛人引领最专业的品鉴"];
//    [self.recommendView setAttentonBackgroundImage:@"关注框" title:@"关注"];
//    UIView* view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    [self.recommendView addSubviewOfContentView:view];
//    [self.recommendView setOnClickHandler:^{
//        NSLog(@"点击了关注");
//    }];
}

//===============MyView2==================

-(RecommendNHView *)recommendView{
    if (_recommendView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, 268);
        _recommendView = [[RecommendNHView alloc] initWithFrame:frame];
    }
    return _recommendView;
}



//=============MyView===============

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)reflushUI:(UIButton*)button{
    [self.data removeAllObjects];
    if (button.tag == 0) {
        button.tag = 1;
        [self.data addObject:self.model_1];
        [self.data addObject:self.model_0];
        [self.data addObject:self.model_2];
        self.attentionView.tags = self.tags;
        self.attentionView.data = self.data;
    }else if(button.tag == 1){
        button.tag = 2;
        [self.data addObject:self.model_1];
        [self.data addObject:self.model_2];
        [self.data addObject:self.model_0];
        self.attentionView.tags = self.tags;
        self.attentionView.data = self.data;
    }else if (button.tag == 2){
        button.tag = 0;
        [self.data addObject:self.model_2];
        [self.data addObject:self.model_0];
        [self.data addObject:self.model_1];
        self.attentionView.tags = self.tags;
        self.attentionView.data = self.data;
    }
    [self.attentionView execute];
}

-(NSMutableArray *)tags{
    if (_tags == nil) {
        _tags = [NSMutableArray array];
        [_tags addObject:@"1"];
        [_tags addObject:@"2"];
        [_tags addObject:@"3"];
    }
    return _tags;
}

-(NSMutableArray *)data{
    if (_data == nil) {
        _data = [NSMutableArray array];
        [_data addObject:self.model_0];
        [_data addObject:self.model_1];
        [_data addObject:self.model_2];
    }
    return _data;
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

-(NHAttentionView *)attentionView{
    if (_attentionView == nil) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
         CGFloat height = [UIScreen mainScreen].bounds.size.height;
        _attentionView = [[NHAttentionView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
        _attentionView.deletage = self;
    }
    return _attentionView;
}

-(UIButton *)reflush{
    if (_reflush == nil) {
        _reflush = [UIButton buttonWithType:UIButtonTypeCustom];
        _reflush.frame = CGRectMake(0, CGRectGetMaxY(self.attentionView.frame)+40, self.view.frame.size.width, 30);
        [_reflush setTitle:@"刷新UI" forState:UIControlStateNormal];
        [_reflush setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_reflush addTarget:self action:@selector(reflushUI:) forControlEvents:UIControlEventTouchUpInside];
        _reflush.tag = 0;
    }
    return _reflush;
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
