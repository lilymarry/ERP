//
//  XiaDanListModel.m
//  Re-OA
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "XiaDanListModel.h"

@implementation XiaDanListModel
-(instancetype)initWithDic:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.PBDO_Id=dict[@"PBDO_Id"];
        self.PBDO_PBId=dict[@"PBDO_PBId"];
        self.PBDO_ClientId=dict[@"PBDO_ClientId"];
        self.PBDO_ClientNm=dict[@"PBDO_ClientNm"];
        self.PBDO_CmpId=dict[@"PBDO_CmpId"];
        self.PBDO_CmpNm=dict[@"PBDO_CmpNm"];
        self.PBDO_POST_Key=dict[@"PBDO_POST_Key"];
        self.PBDO_POST_Nm=dict[@"PBDO_POST_Nm"];
        self.PBDO_BuyCode=dict[@"PBDO_BuyCode"];
        
        self.PBDO_PBId=dict[@"PBDO_PBId"];
        self.PBDO_PBNm=dict[@"PBDO_PBNm"];
        self.PBDO_I_PmId=dict[@"PBDO_I_PmId"];
        self.PBDO_I_PmNm=dict[@"PBDO_I_PmNm"];
        self.PBDO_II_PmId=dict[@"PBDO_II_PmId"];
        self.PBDO_II_PmNm=dict[@"PBDO_II_PmNm"];
        self.PBDO_III_PmId=dict[@"PBDO_III_PmId"];
        self.PBDO_III_PmNm=dict[@"PBDO_III_PmNm"];
        self.PBDO_IV_PmId=dict[@"PBDO_IV_PmId"];
        self.PBDO_IV_PmNm=dict[@"PBDO_IV_PmNm"];
        self.PBDO_V_PmId=dict[@"PBDO_V_PmId"];
        self.PBDO_V_PmNm=dict[@"PBDO_V_PmNm"];
        self.PBDO_VI_PmId=dict[@"PBDO_VI_PmId"];
        self.PBDO_VI_PmNm=dict[@"PBDO_VI_PmNm"];
        self.PBDO_VII_PmId=dict[@"PBDO_VII_PmId"];
        self.PBDO_VII_PmNm=dict[@"PBDO_VII_PmNm"];
        
        self.PBDO_Long=dict[@"PBDO_Long"];
        self.PBDO_Width=dict[@"PBDO_Width"];
        self.PBDO_BuyNum=dict[@"PBDO_BuyNum"];
        self.PBDO_I_line=dict[@"PBDO_I_line"];
        self.PBDO_II_line=dict[@"PBDO_II_line"];
        self.PBDO_III_line=dict[@"PBDO_III_line"];
         self.PBDO_IV_line=dict[@"PBDO_IV_line"];
         self.PBDO_V_line=dict[@"PBDO_V_line"];
         self.PBDO_VI_line=dict[@"PBDO_VI_line"];
         self.PBDO_VII_line=dict[@"PBDO_VII_line"];
         self.PBDO_VIII_line=dict[@"PBDO_VIII_line"];
         self.PBDO_PPTid=dict[@"PBDO_PPTid"];
         self.PBDO_PPTnm=dict[@"PBDO_PPTnm"];
         self.PBDO_DeliveryTm=dict[@"PBDO_DeliveryTm"];
         self.PBDO_Note=dict[@"PBDO_Note"];
         self.PBDO_start_tm=dict[@"PBDO_start_tm"];
         self.PBDO_over_tm=dict[@"PBDO_over_tm"];
        
        self.PBDO_ClientNmAbbreviation=dict[@"PBDO_ClientNmAbbreviation"];
        self.PBDO_OrderCode=dict[@"PBDO_OrderCode"];
        self.PBDO_PBCorrugatedLine=dict[@"PBDO_PBCorrugatedLine"];
        self.PBDO_Plate=dict[@"PBDO_Plate"];
        self.PBDO_PaperNumber=dict[@"PBDO_PaperNumber"];
        
        self.isExist=dict[@"isExist"];
        self.state=dict[@"state"];
        self.isChild= NO;
        self.isExpended= NO;
        
        self.OrderCode=dict[@"OrderCode"];
        
        self.ProductionDescription=dict[@"ProductionDescription"];
        self.DeliveryNote=dict[@"DeliveryNote"];
        
        self.PBDO_I_PmCode=dict[@"PBDO_I_PmCode"];
        self.PBDO_II_PmCode=dict[@"PBDO_II_PmCode"];
        self.PBDO_III_PmCode=dict[@"PBDO_III_PmCode"];
        self.PBDO_IV_PmCode=dict[@"PBDO_IV_PmCode"];
         self.PBDO_V_PmCode=dict[@"PBDO_V_PmCode"];
         self.PBDO_VI_PmCode=dict[@"PBDO_VI_PmCode"];
         self.PBDO_VII_PmCode=dict[@"PBDO_VII_PmCode"];
        self.isSeleted=NO;
        
//        DeliveryNote = "";
//        ProductionDescription = "";
  
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone
{
    XiaDanListModel *copy = [[[self class] allocWithZone:zone] init];
    copy.PBDO_Id  = [_PBDO_Id copy];
    copy.PBDO_PBId=[_PBDO_PBId copy];
    copy.PBDO_ClientId  = [_PBDO_ClientId copy];
    copy.PBDO_ClientNm  = [_PBDO_ClientNm copy];
    copy.PBDO_CmpId  =[_PBDO_CmpId copy];
    copy.PBDO_CmpNm  = [_PBDO_CmpNm copy];
    copy.PBDO_POST_Key  = [_PBDO_POST_Key copy];
   
  

    copy.PBDO_POST_Nm=[_PBDO_POST_Nm copy];

    copy.PBDO_BuyCode=[_PBDO_BuyCode copy];
    
    copy.PBDO_PBId=[_PBDO_PBId copy];
    copy.PBDO_PBNm=[_PBDO_PBNm copy];
    copy.PBDO_I_PmId=[_PBDO_I_PmId copy];
    copy.PBDO_I_PmNm=[_PBDO_I_PmNm copy];
    copy.PBDO_II_PmId=[_PBDO_II_PmId copy];
    copy.PBDO_II_PmNm=[_PBDO_II_PmNm copy];
    copy.PBDO_III_PmId=[_PBDO_III_PmId copy];
    copy.PBDO_III_PmNm=[_PBDO_III_PmNm copy];
    copy.PBDO_IV_PmId=[_PBDO_IV_PmId copy];
    copy.PBDO_IV_PmNm=[_PBDO_IV_PmNm copy];
    copy.PBDO_V_PmId=[_PBDO_V_PmId copy];
    copy.PBDO_V_PmNm=[_PBDO_V_PmNm copy];
    copy.PBDO_VI_PmId=[_PBDO_VI_PmId copy];
    copy.PBDO_VI_PmNm=[_PBDO_VI_PmNm copy];
    copy.PBDO_VII_PmId=[_PBDO_VII_PmId copy];
    copy.PBDO_VII_PmNm=[_PBDO_VII_PmNm copy];
    
    copy.PBDO_Long=[_PBDO_Long copy];
    copy.PBDO_Width=[_PBDO_Width copy];
    copy.PBDO_BuyNum=[_PBDO_BuyNum copy];
    copy.PBDO_I_line=[_PBDO_I_line copy];
    copy.PBDO_II_line=[_PBDO_II_line copy];
    copy.PBDO_III_line=[_PBDO_III_line copy];
    copy.PBDO_IV_line=[_PBDO_IV_line copy];
    copy.PBDO_V_line=[_PBDO_V_line copy];
    copy.PBDO_VI_line=[_PBDO_VI_line copy];
    copy.PBDO_VII_line=[_PBDO_VII_line copy];
    copy.PBDO_VIII_line=[_PBDO_VIII_line copy];
    copy.PBDO_PPTid=[_PBDO_PPTid copy];
    copy.PBDO_PPTnm=[_PBDO_PPTnm copy];
    copy.PBDO_DeliveryTm=[_PBDO_DeliveryTm copy];
    copy.PBDO_Note=[_PBDO_Note copy];
    copy.PBDO_start_tm=[_PBDO_start_tm copy];
    copy.PBDO_over_tm=[_PBDO_over_tm copy];
    
    copy.PBDO_ClientNmAbbreviation=[_PBDO_ClientNmAbbreviation copy];
    copy.PBDO_OrderCode=[_PBDO_OrderCode copy];
    copy.PBDO_PBCorrugatedLine=[_PBDO_PBCorrugatedLine copy];
    copy.PBDO_Plate=[_PBDO_Plate copy];
    copy.PBDO_PaperNumber=[_PBDO_PaperNumber copy];
    
   
    
    copy.isChild= NO;
    copy.isExpended=NO;
    return copy;
}



@end
