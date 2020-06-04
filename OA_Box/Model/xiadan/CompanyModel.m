//
//  CompanyModel.m
//  Re-OA
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "CompanyModel.h"

@implementation CompanyModel
-(instancetype)initWithDic:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.Jcmp_Code=dict[@"Jcmp_Code"];
        self.Jcmp_Id=dict[@"Jcmp_Id"];
        self.Jcmp_Nm=dict[@"Jcmp_Nm"];
        
        self.Jcmp_MinWidth=dict[@"Jcmp_MinWidth"];
        self.Jcmp_MaxWidth=dict[@"Jcmp_MaxWidth"];
        self.Jcmp_MinLength=dict[@"Jcmp_MinLength"];
        self.Jcmp_MaxLength=dict[@"Jcmp_MaxLength"];
        self.Jcmp_MinDate=dict[@"Jcmp_MinDate"];
    }
    return self;
}

@end
