//
//  SYWebViewController.h
//  OA_Box
//
//  Created by imac-1 on 2016/11/17.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYWebViewController : UIViewController<UIWebViewDelegate>
//定义一个属性，方便外接调用
@property (nonatomic, strong) UIWebView *webView;

//声明一个方法，外接调用时，只需要传递一个URL即可
- (void)loadHTML:(NSString *)htmlString;
//@property (nonatomic, strong) NSString *urlStr;
@end
