//
//  AppDelegate.h
//  OA_Box
//
//  Created by imac-1 on 16/9/21.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BMapKit.h>
#import "URL.h"
static NSString *appKey = JpuchKey;
static NSString *channel = @"Publish channel";
static BOOL isProduction = false;
@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>
@property (strong ,nonatomic) BMKMapManager *mapManager;
@property (strong, nonatomic) UIWindow *window;


@end

