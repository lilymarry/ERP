//
//  SelectedCaiZhiViewController.h
//  OA_Box
//
//  Created by imac-1 on 2017/4/13.
//  Copyright © 2017年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaiZhiModel.h"
typedef  void (^finishBlock)(CaiZhiModel *model);
@interface SelectedCaiZhiViewController : UITableViewController
@property(nonatomic,copy) finishBlock block;
-(id)initWithBlock:(finishBlock)ablock;
@end
