//
//  XiaDanFlowCell.h
//  Re-OA
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiaDanFlowCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *State;
@property (weak, nonatomic) IBOutlet UILabel *Remark;
@property (weak, nonatomic) IBOutlet UILabel *SetTime;

@property (weak, nonatomic) IBOutlet UILabel *la_otpnm;
@property (weak, nonatomic) IBOutlet UITextView *tex_cont;

@property (weak, nonatomic) IBOutlet UIImageView *ima_stateView;
@property (weak, nonatomic) IBOutlet UILabel *lab_on;
@end
