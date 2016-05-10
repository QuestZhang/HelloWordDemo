//
//  WebViewController.m
//  HelloWord
//
//  Created by zhangwenqiang on 16/4/28.
//  Copyright © 2016年 zhangwenqiang. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UITableView* tableView = [[UITableView alloc] init];
//    tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [self.view addSubview:tableView];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(15, 50, width-30, (width-30)*(2/3))];
    NSURL* url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    webView.delegate = self;
    webView.backgroundColor = [UIColor blackColor];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return  YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.width;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        UIWebView* webView = nil;
        NSInteger tag = indexPath.row + 1;
        if ([cell viewWithTag:tag]) {
            webView = (UIWebView*)[cell viewWithTag:tag];
        }else{
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            CGRect bounds = CGRectMake(0, 0, width-30, (width-30)*(2/3));
            webView = [[UIWebView alloc] initWithFrame:bounds];
            webView.tag = tag;
            [cell addSubview:webView];
        }
        //http://www.it1224.com/interfaceapp/mine.html
        NSURL* url = [NSURL URLWithString:@"https://www.baidu.com"];
        NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
        [webView loadRequest:request];
        //[webView loadHTMLString:[self getHTMLString] baseURL:nil];
    }
    return cell;
}

-(NSString*)getHTMLString{
    NSString* HTMLString = @"";
//    <!DOCTYPE HTML>
//    <html>
//    <body>
//    
//    <video width="320" height="240" controls="controls">
//    <source src="http://www.w3school.com.cn/i/movie.ogg" type="video/ogg">
//    <source src="http://www.w3school.com.cn/i/movie.mp4" type="video/mp4">
//    </video>
//    
//    </body>
//    </html>
    HTMLString = [HTMLString stringByAppendingString:@"<!DOCTYPE HTML>"];
    HTMLString = [HTMLString stringByAppendingString:@"<html>"];
    HTMLString = [HTMLString stringByAppendingString:@"<body>"];
    HTMLString = [HTMLString stringByAppendingString:@"<video width=\"320\" height=\"240\" controls=\"controls\">"];
    //HTMLString = [HTMLString stringByAppendingString:@"<source src=\"http://www.w3school.com.cn/i/movie.ogg\" type=\"video/ogg\">"];
    HTMLString = [HTMLString stringByAppendingString:@"<source src=\"http://www.w3school.com.cn/i/movie.mp4\" type=\"video/mp4\">"];
    HTMLString = [HTMLString stringByAppendingString:@"</video>"];
    HTMLString = [HTMLString stringByAppendingString:@"</body>"];
    HTMLString = [HTMLString stringByAppendingString:@"</html>"];
    
    return HTMLString;
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
