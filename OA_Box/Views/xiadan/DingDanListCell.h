//
//  DingDanListCell.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/20.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DingDanListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *PBDO_PaperNumber;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_BuyNum;
@property (weak, nonatomic) IBOutlet UILabel *state;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_OrderCode;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_DeliveryTm;

@property (weak, nonatomic) IBOutlet UILabel *guiuge;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_CmpNm;
@property (weak, nonatomic) IBOutlet UILabel *yaxian;
@property (weak, nonatomic) IBOutlet UILabel *PBDO_PPTnm;
@property (weak, nonatomic) IBOutlet UIImageView *imaView;


@end
