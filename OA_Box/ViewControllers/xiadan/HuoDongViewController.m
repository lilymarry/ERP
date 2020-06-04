//
//  HuoDongViewController.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/27.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "HuoDongViewController.h"
#import "AlertHelper.h"
@interface HuoDongViewController ()<UIWebViewDelegate>
//@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation HuoDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView.delegate = self;
    _urlStr=@"http://zhiyebz.com/m-wap/";
  
   // _webView.delegate=self;
   
}
-(void)viewWillAppear:(BOOL)animated
{
  //[self.navigationController setNavigationBarHidden:YES];
   //  NSURL *url= [[NSURL alloc]initWithString:_urlStr];
     [self loadHTML:_urlStr];
//    _webView.backgroundColor=[UIColor clearColor];
//    
//    [(UIScrollView *)[[ _webView subviews] objectAtIndex:0] setBounces:NO];
//      [AlertHelper singleMBHUDShow:@"加载中..." ForView:self.view];
//    [_webView  loadRequest:[NSURLRequest requestWithURL:url]];

}
-(void)viewWillDisappear:(BOOL)animated
{
   
//    NSHTTPCookie *cookie;
//    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    for (cookie in [storage cookies])
//    {
//        [storage deleteCookie:cookie];
//    }
//    
//    NSURLCache * cache = [NSURLCache sharedURLCache];
//    [cache removeAllCachedResponses];
//    [cache setDiskCapacity:0];
//    [cache setMemoryCapacity:0];
    _urlStr=@"http://zhiyebz.com/m-wap/";
}
//-(void)webViewDidFinishLoad:(UIWebView*)theWebView
//{
//    theWebView.backgroundColor = [UIColor blackColor];
//    [(UIScrollView *)[[theWebView subviews] objectAtIndex:0] setBounces:NO];
//       [AlertHelper hideAllHUDsForView:self.view];
//    
//    //  return [super webViewDidFinishLoad:theWebView];
//}
//- (void)webViewDidStartLoad:(UIWebView *)webView{
//    
//    NSLog(@"webViewDidStartLoad");
//    
//}
//
//
//
//-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
//    [AlertHelper hideAllHUDsForView:self.view];
//    
//    NSLog(@"DidFailLoadWithError");
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
