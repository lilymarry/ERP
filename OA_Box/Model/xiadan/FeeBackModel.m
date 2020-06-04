//
//  FeeBackModel.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/25.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "FeeBackModel.h"

@implementation FeeBackModel
-(instancetype)initWithDic:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.FB_BoardOrderNum=dict[@"FB_BoardOrderNum"];
        self.FB_CmpId=dict[@"FB_CmpId"];
        self.FB_CmpNm=dict[@"FB_CmpNm"];
        self.FB_CompleteDate=dict[@"FB_CompleteDate"];
        self.FB_ConductDate=dict[@"FB_ConductDate"];
        self.FB_Content=dict[@"FB_Content"];
        self.FB_Id=dict[@"FB_Id"];
        self.FB_Reply=dict[@"FB_Reply"];
        self.FB_SubmitDate=dict[@"FB_SubmitDate"];
        self.FB_Type=dict[@"FB_Type"];
    }
    return self;
}

@end
