//
//  ShopDetailViewController.h
//  OA_Box
//
//  Created by imac-1 on 2016/12/15.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XiaDanListModel.h"
#import "CommonDelegate.h"
@interface ShopDetailViewController : UIViewController
@property(nonatomic,strong)XiaDanListModel *khmodel;

@property (weak,nonatomic) id<CommonNotification> refreshNotification;
@end
