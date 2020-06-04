//
//  SelectTypeView.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/24.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol selectLeiXingDelegate <NSObject>
-(void)selectLeiXingWithNum:(NSString *)row;
@end
@interface SelectTypeView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(strong ,nonatomic)NSMutableArray *leiXingArr;
@property(weak,nonatomic) id <selectLeiXingDelegate>dataDelegate;
//- (id)initWithFrame:(CGRect)frame;

@end
