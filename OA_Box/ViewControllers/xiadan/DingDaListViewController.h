//
//  DingDaListViewController.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/20.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DingDaListViewController : UIViewController
@property(strong,nonatomic)NSString *type;//区别进入方式 type=1 从意见反馈进入   type=2 主界面正常进入

@property(strong,nonatomic)NSString *dingDanState;
@end
