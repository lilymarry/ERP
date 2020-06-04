//
//  TuiHuoModel.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/28.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "TuiHuoModel.h"

@implementation TuiHuoModel
-(instancetype)initWithDic:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.Amount=dict[@"Amount"];
        self.Code=dict[@"Code"];
        self.CustomCode=dict[@"CustomCode"];
        self.Date=dict[@"Date"];
        self.DeliveryCode=dict[@"DeliveryCode"];
        self.Freight=dict[@"Freight"];
        self.FreightSquare=dict[@"FreightSquare"];
        self.Money=dict[@"Money"];
        
        self.OrderCode=dict[@"OrderCode"];
        self.PricePaperBoard=dict[@"PricePaperBoard"];
        self.Reason=dict[@"Reason"];
        self.ZHJG=dict[@"ZHJG"];
               
    }
    return self;
}


@end
