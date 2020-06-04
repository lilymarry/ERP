//
//  XiaDanFlowModel.m
//  Re-OA
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "XiaDanFlowModel.h"

@implementation XiaDanFlowModel
-(instancetype)initWithDic:(NSDictionary *)dict
{
    if (self=[super init]) {
        
//        self.POL_Id=dict[@"POL_Id"];
//        self.POL_Oid=dict[@"POL_Oid"];
//        self.POL_TPKey=dict[@"POL_TPKey"];
//        self.POL_TPNm=dict[@"POL_TPNm"];
//        self.POL_Yi_Tit=dict[@"POL_Yi_Tit"];
//        self.POL_Yi_Con=dict[@"POL_Yi_Con"];
//        self.POL_Er_Tit=dict[@"POL_Er_Tit"];
//        self.POL_Er_Con=dict[@"POL_Er_Con"];
//        self.POL_San_Tit=dict[@"POL_San_Tit"];
//        self.POL_San_Con=dict[@"POL_San_Con"];
//        self.POL_Do_Pid=dict[@"POL_Do_Pid"];
//        self.POL_Do_PNm=dict[@"POL_Do_PNm"];
//        self.POL_FormJson=dict[@"POL_FormJson"];
//        self.crt_tm=dict[@"crt_tm"];
        
                self.SID=dict[@"SID"];
                self.OrderCode=dict[@"OrderCode"];
                self.OrderCodeWeb=dict[@"OrderCodeWeb"];
                self.State=dict[@"State"];
                self.Remark=dict[@"Remark"];
                self.SetTime=dict[@"SetTime"];

    }
    return self;
}
@end
