//
//  SelectCompanyView.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/24.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//
#import "CompanyModel.h"
#import "User.h"
#import "XiaDanWebAPI.h"
#import <UIKit/UIKit.h>
@protocol selectCompanyDelegate <NSObject>
-(void)selectCompanyWithNum:(CompanyModel *)row;
@end
@interface SelectCompanyView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(strong ,nonatomic)NSMutableArray *leiXingArr;
@property(weak,nonatomic) id <selectCompanyDelegate>dataDelegate;

@end
