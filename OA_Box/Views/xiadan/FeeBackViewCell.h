//
//  FeeBackViewCell.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/25.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeeBackViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *FB_BoardOrderNum;//订单编号

@property (weak, nonatomic) IBOutlet UILabel *FB_CmpId;// 工厂ID
@property (weak, nonatomic) IBOutlet UILabel *FB_CmpNm;//工厂名称
@property (weak, nonatomic) IBOutlet UILabel *FB_CompleteDate; //完成时间
@property (weak, nonatomic) IBOutlet UILabel *FB_ConductDate;//进行时间
@property (weak, nonatomic) IBOutlet UITextView *FB_Content;// 反馈内容
@property (weak, nonatomic) IBOutlet UILabel *FB_Id;//编号
@property (weak, nonatomic) IBOutlet UILabel *FB_Reply;//回复反馈
@property (weak, nonatomic) IBOutlet UILabel *FB_SubmitDate;//提交时间
@property (weak, nonatomic) IBOutlet UILabel *FB_Type;//处理类型(1=未处理,2=正在处理,3=已处理)
@end
