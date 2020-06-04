//
//  DingDanDetailCell.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/20.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DingDanDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *PBDO_start_tm;

//@property (weak, nonatomic) IBOutlet UILabel *PBDO_ClientNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_CmpNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_PaperNumber;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_OrderCode;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_BuyCode;

@property (weak, nonatomic) IBOutlet UILabel *PBDO_I_PmNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_II_PmNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_III_PmNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_IV_PmNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_V_PmNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_VI_PmNm;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_VII_PmNm;

@property (weak, nonatomic) IBOutlet UILabel *PBDO_Long;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_Width;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_BuyNum;

@property (weak, nonatomic) IBOutlet UILabel *PBDO_I_line;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_II_line;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_III_line;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_IV_line;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_V_line;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_VI_line;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_VII_line;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_VIII_line;


@property (weak, nonatomic) IBOutlet UILabel *PBDO_DeliveryTm;
@property (weak, nonatomic) IBOutlet UILabel *ProductionDescription;
@property (weak, nonatomic) IBOutlet UILabel *DeliveryNote;

@property (weak, nonatomic) IBOutlet UILabel *zhanghuName;
@property (weak, nonatomic) IBOutlet UILabel *yaxing;
@property (weak, nonatomic) IBOutlet UILabel *zhuyiNote;
@property (weak, nonatomic) IBOutlet UILabel *maoban;

@end
