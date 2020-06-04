//
//  PiliangSelectView.h
//  OA_Box
//
//  Created by imac-1 on 2017/1/23.
//  Copyright © 2017年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol selectPilingDelegate <NSObject>
-(void)selectPilingWithNum:(NSString *)num;
@end
@interface PiliangSelectView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(strong ,nonatomic)NSArray *leiXingArr;
@property(weak,nonatomic) id <selectPilingDelegate>dataDelegate;
-(void)refreshTable;

@end
