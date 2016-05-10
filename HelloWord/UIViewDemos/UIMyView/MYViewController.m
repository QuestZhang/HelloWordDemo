//
//  MYViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/5/10.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "MYViewController.h"
#import "NHAttentionView.h"

@interface MYViewController ()<NHAttentionViewDeletage>

@property(nonatomic,strong) NSMutableArray* tags;

@property(nonatomic,strong) NSMutableArray<NHAttentionModel*>* data;

@property(nonatomic,strong) NHAttentionModel* model_0;
@property(nonatomic,strong) NHAttentionModel* model_1;
@property(nonatomic,strong) NHAttentionModel* model_2;

@property(nonatomic,strong) NHAttentionView* attentionView;

@end

@implementation MYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.attentionView.tags = self.tags;
    self.attentionView.data = self.data;
    [self.attentionView setTitle:@"农红广场" image:@"农红底部-按下状态"];
    [self.attentionView setMoreTitle:@"更多" moreImage:@"更多"];
    [self.attentionView execute];
    [self.view addSubview:self.attentionView];
    
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    NHAttentionItemView* itemView = [[NHAttentionItemView alloc] initWithFrame:CGRectMake(0, 0, width/3, 200)];
//    NHAttentionModel* model = self.data[0];
//    itemView.title = model.title;
//    itemView.detailTitle = model.detailTitle;
//    itemView.image = model.image;
//    itemView.buttonBackgroundImage = model.button;
    //[self.view addSubview:itemView];
}

-(void)onClickOfMore:(UIButton*)moreButton{
    NSLog(@"onClickOfMore");
}

-(void)onClickOfItem:(NHAttentionItemView*)item{
 NSLog(@"onClickOfItem%ld",item.tag);
}

-(void)onClickItemForModel:(NHAttentionModel *)model{
    NSLog(@"%@",model.description);
}

-(void)onClickOfAttentionTag:(NSInteger)tag{
 NSLog(@"onClickOfAttentionTag%ld",tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
        _model_0.button  = @"关注";
        _model_0.buttonTitle = @"关注";
        _model_0.buttonTitleColor = 0xE22222;
    }
    return _model_0;
}

-(NHAttentionModel *)model_1{
    if (_model_1 == nil) {
        _model_1 = [[NHAttentionModel alloc] init];
        _model_1.title = @"快乐小香蕉";
        _model_1.detailTitle = @"做最专业操手";
        _model_1.image = @"http://a.hiphotos.baidu.com/image/pic/item/f9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg";
        _model_1.button  = @"关注";
        _model_1.buttonTitle = @"关注";
        _model_1.buttonTitleColor = 0xE22222;
    }
    return _model_1;
}

-(NHAttentionModel *)model_2{
    if (_model_2 == nil) {
        _model_2 = [[NHAttentionModel alloc] init];
        _model_2.title = @"快乐小二B";
        _model_2.detailTitle = @"做最专业喜剧人";
        _model_2.image = @"http://h.hiphotos.baidu.com/image/pic/item/dbb44aed2e738bd4ec4f29e6a58b87d6267ff9ff.jpg";
        _model_2.button  = @"关注";
        _model_2.buttonTitle = @"关注";
        _model_2.buttonTitleColor = 0xE22222;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
