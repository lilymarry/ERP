//
//  AddDinDanViewController.h
//  OA_Box
//
//  Created by imac-1 on 2016/11/21.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"CompanyModel.h"
#import "XiaDanListModel.h"


@interface AddDinDanViewController : UIViewController
@property(strong,nonatomic)CompanyModel *model;
@property(nonatomic,strong)XiaDanListModel *khmodel;
@property(nonatomic,strong)NSString *state;//修改1 新增0
@end
