//
//  UISTableTableViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/3/8.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "UISTableViewController.h"
#import "UIText.h"
#import "UISwitchViewController.h"
#import "UIViewViewController.h"
#import "WebViewController.h"

@interface UISTableViewController ()

@property(nonatomic,strong) NSMutableArray *title;
@property(nonatomic,strong) NSMutableArray *message;
@property(nonatomic,strong) NSMutableDictionary *dictionary;


-(void) loadData;
-(void) switchUI:(UIViewType) type;
-(UIViewType)getType:(NSString *)name;

@end

@implementation UISTableViewController

@synthesize title;
@synthesize message;
@synthesize dictionary;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.transform = CGAffineTransformMakeRotation(M_PI/-2); //旋转滑动方向
    self.tableView.rowHeight = 60.0;
    
    [self setSeparatorWithTableView:self.tableView edgeInsets:UIEdgeInsetsZero];
    
    dictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    [self loadData];
}

-(void)loadData{
    title = [NSMutableArray arrayWithCapacity:0];
    [title addObject:@"NSLog打印"];
    [title addObject:@""];
    [dictionary setObject:title forKey:@"OC语法基础"];
    
    title = [NSMutableArray arrayWithCapacity:0];
    [title addObject:@"UILabel控件"];
    [title addObject:@"UITextView控件"];
    [title addObject:@"UITextFilde控件"];
    [title addObject:@"UIButton控件"];
    [title addObject:@"UISwitch控件"];
    [title addObject:@"UIView控件"];
    [title addObject:@"UIWebView控件"];
    [title addObject:@""];
    [dictionary setObject:title forKey:@"IOS的UI控件"];
}

//设置分割线
-(void)setSeparatorWithTableView:(UITableView*)tableView edgeInsets:(UIEdgeInsets) edgeInsets{
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        tableView.layoutMargins = edgeInsets;
    }
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        tableView.separatorInset = edgeInsets;
    }
}

//设置分割线
-(void)setSeparatorWithCell:(UITableViewCell*)cell edgeInsets:(UIEdgeInsets) edgeInsets{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.layoutMargins = edgeInsets;
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = edgeInsets;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view title source

//表示在这TableView里的块数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dictionary.allKeys.count;
}

//表示在这个部分里的行的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)[dictionary objectForKey:dictionary.allKeys[section]]).count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.width;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return nil;
}

//获取某一行内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdetifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetifier];
        //设置选中的风格
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.transform = CGAffineTransformMakeRotation(M_PI/2);//设置cell内容旋转
        cell.textLabel.frame = CGRectMake(10, CGRectGetMinY(cell.textLabel.frame), CGRectGetWidth(cell.textLabel.frame), CGRectGetHeight(cell.textLabel.frame));
    }
    
    [self setSeparatorWithCell:cell edgeInsets:UIEdgeInsetsZero];
    
    NSString *string = (NSString *)[dictionary objectForKey:dictionary.allKeys[indexPath.section]][indexPath.row];
    [cell.textLabel setText:string];
    
    return cell;
}

//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"------##---%@------##------",cell.textLabel.text);
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *titleContent = dictionary.allKeys[indexPath.section];
    NSString *msgContent = [dictionary objectForKey:dictionary.allKeys[indexPath.section]][indexPath.row];
    
    if ([msgContent isEqualToString:@""] && msgContent.length == 0) {
        return;
    }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:titleContent
                                                                   message:msgContent
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              NSLog(@"确定了");
                                                              NSString *name = [msgContent substringWithRange:NSMakeRange(0, msgContent.length-2)];
                                                              [self switchUI:[self getType:name]];
                                                              unichar ch = [name characterAtIndex:1];
                                                              NSLog(@"---name:%@---char:%c-",name,ch);
                                                              //[name integerValue];//字符串转成Integer
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        NSLog(@"取消了");
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(UIViewType)getType:(NSString *)name{
    if([@"UILabel" isEqualToString:name]){
        return UILabelType;
    }else if([@"UITextView" isEqualToString:name]){
        return UILabelType;
    }else if([@"UITextFilde" isEqualToString:name]){
        return UILabelType;
    }else if ([@"UISwitch" isEqualToString:name]){
        return UISwitchType;
    }else if ([@"UIView" isEqualToString:name]){
        return UIViewViewType;
    }else if ([@"UIWebView" isEqualToString:name]){
        return UIWebViewType;
    }
    
    return -1;
}

-(void)switchUI:(UIViewType) type{
    //*********** ViewController 之间的跳转 ***************
    //[self showViewController:<#(nonnull UIViewController *)#> sender:<#(nullable id)#>];
    //[self.navigationController showViewController:<#(nonnull UIViewController *)#> sender:<#(nullable id)#>];
    //[self showDetailViewController:<#(nonnull UIViewController *)#> sender:<#(nullable id)#>];
    //[self dismissViewControllerAnimated:<#(BOOL)#> completion:<#^(void)completion#>];
    
    //[self.navigationController pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>];
    //[self.navigationController popViewControllerAnimated:<#(BOOL)#>];
    
    //[self presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>];
    //[self.navigationController presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>];
    //[self dismissViewControllerAnimated:<#(BOOL)#> completion:<#^(void)completion#>];
    //[self.navigationController dismissViewControllerAnimated:<#(BOOL)#> completion:<#^(void)completion#>];
    
    switch (type) {
        case UILabelType:
             //[self showDetailViewController:[[UIText alloc] initWithNibName:@"UIText" bundle:nil]  sender:nil];

            [self.navigationController showViewController:[[UIText alloc] initWithNibName:@"UIText" bundle:nil] sender:nil];
            
            //[self presentViewController:[[UIText alloc] initWithNibName:@"UIText" bundle:nil] animated:YES completion:nil];
             NSLog(@"---确定了---");
            
            //[self.navigationController pushViewController:[[UIText alloc] initWithNibName:@"UIText" bundle:nil] animated:YES];
            
            //[self.navigationController presentViewController:[[UIText alloc] initWithNibName:@"UIText" bundle:nil] animated:YES completion:nil];
            
            break;
            
        case UIBtnType:
            
            break;
            
        case UITextViewType:
            
            break;
            
            
        case UITextFildType:
            
            break;
            
        case UISwitchType:
             [self showViewController:[[UISwitchViewController alloc] initWithNibName:@"UISwitchViewController" bundle:nil] sender:nil];
            break;
            
        case UIViewViewType:
            
            [self showViewController:[[UIViewViewController alloc] initWithNibName:@"UIViewViewController" bundle:nil] sender:nil];
            break;
            
        case UIWebViewType:{
            WebViewController* webView = [[WebViewController alloc] init];
            [self.navigationController pushViewController:webView animated:YES];
        }
            break;

            
        default:
            break;
    }
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
