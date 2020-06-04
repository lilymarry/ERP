//
//  XiaDanWebAPI.m
//  Re-OA
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "XiaDanWebAPI.h"
#import "NetRequestTool.h"
#import "URL.h"
//网络接口
#define userAPI [NSString stringWithFormat:@"%@/Wap/ClientHandler.ashx",kDomain]
#define zhibanAPI [NSString stringWithFormat:@"%@/Wap/PaperInfoHandler.ashx",kDomain]
#define PaperBoardAPI [NSString stringWithFormat:@"%@/Wap/PaperBoardOrderHandler.ashx",kDomain]
#define AddApi [NSString stringWithFormat:@"%@/Wap/FeedBackHandler.ashx",kDomain]
#define picApi [NSString stringWithFormat:@"%@/WAP/BannerHandler.ashx",kDomain]



@implementation XiaDanWebAPI
//1.用户登录
+(void)loginWithUser:(NSString *)Cmgt_Acct Cmgt_Pwd:(NSString *)Cmgt_Pwd Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"login",@"Cmgt_Acct":Cmgt_Acct,@"Cmgt_Pwd":Cmgt_Pwd};
    [[NetRequestTool sharedRequest] request:param URL:userAPI success:success fail:fail];
}
//2.获取厂区
+(void)getJoinCompanyWithCmgt_Id:(NSString *)Cmgt_Acct Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"getJoinCompany",@"Cmgt_Id":Cmgt_Acct};
    [[NetRequestTool sharedRequest] request:param URL:userAPI success:success fail:fail];
}

//3.获取材质信息
+(void)getPaper_MaterialWithJcmp_Id:(NSString *)Jcmp_Id Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"getPaper_Material",@"Jcmp_Id":Jcmp_Id};
    [[NetRequestTool sharedRequest] request:param URL:zhibanAPI success:success fail:fail];
}
//3.获取材质信息
+(void)getGetPMSPListWithJcmp_Id:(NSString *)Jcmp_Id Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"GetPMSPList",@"Jcmp_Id":Jcmp_Id};
    [[NetRequestTool sharedRequest] request:param URL:zhibanAPI success:success fail:fail];
}

//4.获取纸楞信息
+(void)getPaper_BoardWithJcmp_Id:(NSString *)Jcmp_Id Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"getPaper_Board",@"Jcmp_Id":Jcmp_Id};
    [[NetRequestTool sharedRequest] request:param URL:zhibanAPI success:success fail:fail];
}

//5.获取压型信息
+(void)getgetPaper_PressureWithJcmp_Id:(NSString *)Jcmp_Id Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"getPaper_Pressure",@"Jcmp_Id":Jcmp_Id};
    [[NetRequestTool sharedRequest] request:param URL:zhibanAPI success:success fail:fail];
}

//6 增加订单
+(void)addPaperOrderCmgt_Id:(NSString *)Cmgt_Id Cmgt_Name:(NSString *)Cmgt_Name
                       PBDO_CmpId:(NSString *)PBDO_CmpId PBDO_CmpNm:(NSString *)PBDO_CmpNm
                       PBDO_POST_Key:(NSString *)PBDO_POST_Key PBDO_POST_Nm:(NSString *)PBDO_POST_Nm
                       PBDO_BuyCode:(NSString *)PBDO_BuyCode PBDO_PBId:(NSString *)PBDO_PBId
                       PBDO_PBNm:(NSString *)PBDO_PBNm
                        PBDO_I_PmId:(NSString *)PBDO_I_PmId       PBDO_I_PmNm:(NSString *)PBDO_I_PmNm
                        PBDO_II_PmId:(NSString *)PBDO_II_PmId     PBDO_II_PmNm:(NSString *)PBDO_II_PmNm
                        PBDO_III_PmId:(NSString *)PBDO_III_PmId   PBDO_III_PmNm:(NSString *)PBDO_III_PmNm
                        PBDO_IV_PmId:(NSString *)PBDO_IV_PmId     PBDO_IV_PmNm:(NSString *)PBDO_IV_PmNm
                        PBDO_V_PmId:(NSString *)PBDO_V_PmId      PBDO_V_PmNm:(NSString *)PBDO_V_PmNm
                        PBDO_VI_PmId:(NSString *)PBDO_VI_PmId     PBDO_VI_PmNm:(NSString *)PBDO_VI_PmNm
                        PBDO_VII_PmId:(NSString *)PBDO_VII_PmId    PBDO_VII_PmNm:(NSString *)PBDO_VII_PmNm
                       PBDO_Long:(NSString *)PBDO_Long
                       PBDO_Width:(NSString *)PBDO_Width PBDO_BuyNum:(NSString *)PBDO_BuyNum
                       PBDO_I_line:(NSString *)PBDO_I_line PBDO_II_line:(NSString *)PBDO_II_line
                       PBDO_III_line:(NSString *)PBDO_III_line PBDO_IV_line:(NSString *)PBDO_IV_line
                       PBDO_V_line:(NSString *)PBDO_V_line PBDO_VI_line:(NSString *)PBDO_VI_line
                       PBDO_VII_line:(NSString *)PBDO_VII_line PBDO_VIII_line:(NSString *)PBDO_VIII_line
                       PBDO_PPTid:(NSString *)PBDO_PPTid PBDO_PPTnm:(NSString *)PBDO_PPTnm
                       PBDO_DeliveryTm:(NSString *)PBDO_DeliveryTm PBDO_Note:(NSString *)PBDO_Note
                       PBDO_start_tm:(NSString *)PBDO_start_tm PBDO_over_tm:(NSString *)PBDO_over_tm
                  PBDO_ClientNmAbbreviation:(NSString *)PBDO_ClientNmAbbreviation
            PBDO_OrderCode:(NSString *)PBDO_OrderCode PBDO_PBCorrugatedLine:(NSString *)PBDO_PBCorrugatedLine
              PBDO_Plate:(NSString *)PBDO_Plate PBDO_PaperNumber:(NSString *)PBDO_PaperNumber  ProductionDescription:(NSString *)ProductionDescription DeliveryNote:(NSString *)DeliveryNote PBDO_Id:(NSString *)PBDO_Id Cmgt_CustomerCode:(NSString *)Cmgt_CustomerCode
                     Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"addPaperOrder",@"Cmgt_Id":Cmgt_Id,@"Cmgt_Name":Cmgt_Name,@"PBDO_CmpId":PBDO_CmpId,@"PBDO_CmpNm":PBDO_CmpNm
                             ,@"PBDO_POST_Key":PBDO_POST_Key,@"PBDO_POST_Nm":PBDO_POST_Nm
                             ,@"PBDO_BuyCode":PBDO_BuyCode,@"PBDO_PBId":PBDO_PBId
                             ,@"PBDO_PBNm":PBDO_PBNm
                             ,@"PBDO_I_PmId":PBDO_I_PmId, @"PBDO_I_PmNm":PBDO_I_PmNm,
                               @"PBDO_II_PmId":PBDO_II_PmId, @"PBDO_II_PmNm":PBDO_II_PmNm,
                                @"PBDO_III_PmId":PBDO_III_PmId, @"PBDO_III_PmNm":PBDO_III_PmNm,
                              @"PBDO_IV_PmId":PBDO_IV_PmId, @"PBDO_IV_PmNm":PBDO_IV_PmNm,
                               @"PBDO_V_PmId":PBDO_V_PmId, @"PBDO_V_PmNm":PBDO_V_PmNm,
                              @"PBDO_VI_PmId":PBDO_VI_PmId, @"PBDO_VI_PmNm":PBDO_VI_PmNm,
                              @"PBDO_VII_PmId":PBDO_VII_PmId, @"PBDO_VII_PmNm":PBDO_VII_PmNm,
                             
                             
                             @"PBDO_Long":PBDO_Long,@"PBDO_Width":PBDO_Width
                             ,@"PBDO_BuyNum":PBDO_BuyNum
                             ,@"PBDO_I_line":PBDO_I_line,@"PBDO_II_line":PBDO_II_line,@"PBDO_III_line":PBDO_III_line,@"PBDO_IV_line":PBDO_IV_line,@"PBDO_V_line":PBDO_V_line,@"PBDO_VI_line":PBDO_VI_line,@"PBDO_VII_line":PBDO_VII_line,@"PBDO_VIII_line":PBDO_VIII_line,
                              @"PBDO_PPTid":PBDO_PPTid  
                             ,@"PBDO_DeliveryTm":PBDO_DeliveryTm,@"PBDO_Note":PBDO_Note
                             ,@"PBDO_start_tm":PBDO_start_tm,@"PBDO_over_tm":PBDO_over_tm,
                             
                             @"PBDO_ClientNmAbbreviation":PBDO_ClientNmAbbreviation
                             ,@"PBDO_OrderCode":PBDO_OrderCode,@"PBDO_PBCorrugatedLine":PBDO_PBCorrugatedLine
                             ,@"PBDO_Plate":PBDO_Plate,@"PBDO_PaperNumber":PBDO_PaperNumber , @"PBDO_PPTnm":PBDO_PPTnm
                             ,@"ProductionDescription":ProductionDescription ,@"DeliveryNote":DeliveryNote ,@"PBDO_Id":PBDO_Id,@"Cmgt_CustomerCode":Cmgt_CustomerCode
                    
                             };
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
}
//加入购物车功能
+(void)addPaperTempOrderCmgt_Id:(NSString *)Cmgt_Id Cmgt_Name:(NSString *)Cmgt_Name
                 PBDO_CmpId:(NSString *)PBDO_CmpId PBDO_CmpNm:(NSString *)PBDO_CmpNm
              PBDO_POST_Key:(NSString *)PBDO_POST_Key PBDO_POST_Nm:(NSString *)PBDO_POST_Nm
               PBDO_BuyCode:(NSString *)PBDO_BuyCode PBDO_PBId:(NSString *)PBDO_PBId
                  PBDO_PBNm:(NSString *)PBDO_PBNm
                PBDO_I_PmId:(NSString *)PBDO_I_PmId       PBDO_I_PmNm:(NSString *)PBDO_I_PmNm
               PBDO_II_PmId:(NSString *)PBDO_II_PmId     PBDO_II_PmNm:(NSString *)PBDO_II_PmNm
              PBDO_III_PmId:(NSString *)PBDO_III_PmId   PBDO_III_PmNm:(NSString *)PBDO_III_PmNm
               PBDO_IV_PmId:(NSString *)PBDO_IV_PmId     PBDO_IV_PmNm:(NSString *)PBDO_IV_PmNm
                PBDO_V_PmId:(NSString *)PBDO_V_PmId      PBDO_V_PmNm:(NSString *)PBDO_V_PmNm
               PBDO_VI_PmId:(NSString *)PBDO_VI_PmId     PBDO_VI_PmNm:(NSString *)PBDO_VI_PmNm
              PBDO_VII_PmId:(NSString *)PBDO_VII_PmId    PBDO_VII_PmNm:(NSString *)PBDO_VII_PmNm
                  PBDO_Long:(NSString *)PBDO_Long
                 PBDO_Width:(NSString *)PBDO_Width PBDO_BuyNum:(NSString *)PBDO_BuyNum
                PBDO_I_line:(NSString *)PBDO_I_line PBDO_II_line:(NSString *)PBDO_II_line
              PBDO_III_line:(NSString *)PBDO_III_line PBDO_IV_line:(NSString *)PBDO_IV_line
                PBDO_V_line:(NSString *)PBDO_V_line PBDO_VI_line:(NSString *)PBDO_VI_line
              PBDO_VII_line:(NSString *)PBDO_VII_line PBDO_VIII_line:(NSString *)PBDO_VIII_line
                 PBDO_PPTid:(NSString *)PBDO_PPTid PBDO_PPTnm:(NSString *)PBDO_PPTnm
            PBDO_DeliveryTm:(NSString *)PBDO_DeliveryTm PBDO_Note:(NSString *)PBDO_Note
              PBDO_start_tm:(NSString *)PBDO_start_tm PBDO_over_tm:(NSString *)PBDO_over_tm
  PBDO_ClientNmAbbreviation:(NSString *)PBDO_ClientNmAbbreviation
             PBDO_OrderCode:(NSString *)PBDO_OrderCode PBDO_PBCorrugatedLine:(NSString *)PBDO_PBCorrugatedLine
                 PBDO_Plate:(NSString *)PBDO_Plate PBDO_PaperNumber:(NSString *)PBDO_PaperNumber  ProductionDescription:(NSString *)ProductionDescription DeliveryNote:(NSString *)DeliveryNote PBDO_Id:(NSString *)PBDO_Id Cmgt_CustomerCode:(NSString *)Cmgt_CustomerCode
                  PBDO_I_PmCode:(NSString *)PBDO_I_PmCode
                  PBDO_II_PmCode:(NSString *)PBDO_II_PmCode
                  PBDO_III_PmCode:(NSString *)PBDO_III_PmCode
                  PBDO_IV_PmCode:(NSString *)PBDO_IV_PmCode
                  PBDO_V_PmCode:(NSString *)PBDO_V_PmCode
                  PBDO_VI_PmCode:(NSString *)PBDO_VI_PmCode
                  PBDO_VII_PmCode:(NSString *)PBDO_VII_PmCode

                     Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"PBDO_I_PmCode":PBDO_I_PmCode,@"PBDO_II_PmCode":PBDO_II_PmCode,@"PBDO_III_PmCode":PBDO_III_PmCode,@"PBDO_IV_PmCode":PBDO_IV_PmCode,@"PBDO_V_PmCode":PBDO_V_PmCode,@"PBDO_VI_PmCode":PBDO_VI_PmCode,@"PBDO_VII_PmCode":PBDO_VII_PmCode,
                             @"method":@"addPaperTempOrder",@"Cmgt_Id":Cmgt_Id,@"Cmgt_Name":Cmgt_Name,@"PBDO_CmpId":PBDO_CmpId,@"PBDO_CmpNm":PBDO_CmpNm
                             ,@"PBDO_POST_Key":PBDO_POST_Key,@"PBDO_POST_Nm":PBDO_POST_Nm
                             ,@"PBDO_BuyCode":PBDO_BuyCode,@"PBDO_PBId":PBDO_PBId
                             ,@"PBDO_PBNm":PBDO_PBNm
                             ,@"PBDO_I_PmId":PBDO_I_PmId, @"PBDO_I_PmNm":PBDO_I_PmNm,
                             @"PBDO_II_PmId":PBDO_II_PmId, @"PBDO_II_PmNm":PBDO_II_PmNm,
                             @"PBDO_III_PmId":PBDO_III_PmId, @"PBDO_III_PmNm":PBDO_III_PmNm,
                             @"PBDO_IV_PmId":PBDO_IV_PmId, @"PBDO_IV_PmNm":PBDO_IV_PmNm,
                             @"PBDO_V_PmId":PBDO_V_PmId, @"PBDO_V_PmNm":PBDO_V_PmNm,
                             @"PBDO_VI_PmId":PBDO_VI_PmId, @"PBDO_VI_PmNm":PBDO_VI_PmNm,
                             @"PBDO_VII_PmId":PBDO_VII_PmId, @"PBDO_VII_PmNm":PBDO_VII_PmNm,
                             
                             
                             @"PBDO_Long":PBDO_Long,@"PBDO_Width":PBDO_Width
                             ,@"PBDO_BuyNum":PBDO_BuyNum
                             ,@"PBDO_I_line":PBDO_I_line,@"PBDO_II_line":PBDO_II_line,@"PBDO_III_line":PBDO_III_line,@"PBDO_IV_line":PBDO_IV_line,@"PBDO_V_line":PBDO_V_line,@"PBDO_VI_line":PBDO_VI_line,@"PBDO_VII_line":PBDO_VII_line,@"PBDO_VIII_line":PBDO_VIII_line,
                             @"PBDO_PPTid":PBDO_PPTid
                             ,@"PBDO_DeliveryTm":PBDO_DeliveryTm,@"PBDO_Note":PBDO_Note
                             ,@"PBDO_start_tm":PBDO_start_tm,@"PBDO_over_tm":PBDO_over_tm,
                             
                             @"PBDO_ClientNmAbbreviation":PBDO_ClientNmAbbreviation
                             ,@"PBDO_OrderCode":PBDO_OrderCode,@"PBDO_PBCorrugatedLine":PBDO_PBCorrugatedLine
                             ,@"PBDO_Plate":PBDO_Plate,@"PBDO_PaperNumber":PBDO_PaperNumber , @"PBDO_PPTnm":PBDO_PPTnm
                             ,@"ProductionDescription":ProductionDescription ,@"DeliveryNote":DeliveryNote ,
                             @"PBDO_Id":PBDO_Id,
                             @"Cmgt_CustomerCode":Cmgt_CustomerCode,
                          

                             };
    
    [[NSUserDefaults standardUserDefaults ]setObject:param forKey:@"DingDanData"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
 [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
    
}


////7.获取订单
//+(void)getPaperOrderWithCmgt_Id:(NSString *)Cmgt_Id count:(NSString *)count endCount:(NSString *)endCount maxId:(NSString *)maxId  Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
//    NSDictionary * param = @{@"method":@"getPaperOrder",@"Cmgt_Id":Cmgt_Id,@"count":count,@"endCount":endCount,@"maxId":maxId};
//    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
//}
////5购物车订单列表
//+(void)getPaperTempOrderWithCmgt_Id:(NSString *)Cmgt_Id count:(NSString *)count endCount:(NSString *)endCount maxId:(NSString *)maxId  Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
//    NSDictionary * param = @{@"method":@"getPaperTempOrder",@"Cmgt_Id":Cmgt_Id,@"count":count,@"endCount":endCount,@"maxId":maxId};
//    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
//}
//8.获取订单轨迹
+(void)getPapaerOrderLocusWithOrderCode:(NSString *)OrderCode PBDO_CmpId:(NSString *)PBDO_CmpId Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"getPaperBoardOrderState",@"OrderCode":OrderCode,@"PBDO_CmpId":PBDO_CmpId};
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
}
////8.获取订单轨迹
//+(void)getPapaerOrderLocusWithPBDO_Id:(NSString *)PBDO_Id Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
//    NSDictionary * param = @{@"method":@"getPapaerOrderLocus",@"PBDO_Id":PBDO_Id};
//    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
//}


//9.读取车辆坐标
+(void)getCarGPSPBDO_CmpId:(NSString *)PBDO_CmpId CarNum:(NSString *)CarNum Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"getCarGPS",@"CarNum":CarNum,@"PBDO_CmpId":PBDO_CmpId};
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
}
//修改用户信息
+(void)modifCompanyWithCmgt_Id:(NSString *)Cmgt_Id Cmgt_CmpNm:(NSString *)Cmgt_CmpNm  Cmgt_CmpNmAbbreviation:(NSString *)Cmgt_CmpNmAbbreviation Cmgt_PNm:(NSString *)Cmgt_PNm Cmgt_PTel:(NSString *)Cmgt_PTel Cmgt_PMobile:(NSString *)Cmgt_PMobile Cmgt_Pwd:(NSString *)Cmgt_Pwd Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    NSDictionary * param = @{@"method":@"UpClient",@"Cmgt_Id":Cmgt_Id,@"Cmgt_CmpNm":Cmgt_CmpNm,@"Cmgt_CmpNmAbbreviation":Cmgt_CmpNmAbbreviation,@"Cmgt_PNm":Cmgt_PNm,@"Cmgt_PTel":Cmgt_PTel,@"Cmgt_PMobile":Cmgt_PMobile,@"Cmgt_Pwd":Cmgt_Pwd};
    [[NetRequestTool sharedRequest] request:param URL:userAPI success:success fail:fail];
}
+(void)modifCompanyWithCmgt_IdDic:(NSDictionary *)dic Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
//    NSDictionary * param = @{@"method":@"UpClient",@"Cmgt_Id":Cmgt_Id,@"Cmgt_CmpNm":Cmgt_CmpNm,@"Cmgt_CmpNmAbbreviation":Cmgt_CmpNmAbbreviation,@"Cmgt_PNm":Cmgt_PNm,@"Cmgt_PTel":Cmgt_PTel,@"Cmgt_PMobile":Cmgt_PMobile,@"Cmgt_Pwd":Cmgt_Pwd};
    [[NetRequestTool sharedRequest] request:dic URL:userAPI success:success fail:fail];
}
//反馈意见
+(void)postAddviseWithCmgt_Id:(NSString *)Cmgt_Id count:(NSString *)count endCount:(NSString *)endCount  FB_Type :(NSString *)FB_Type maxid:(NSString *)maxid Suecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"method":@"GetFeedBackPageTalbe",@"count":count,@"endCount":endCount,@"FB_ClientMgmtId":Cmgt_Id,@"FB_Type":FB_Type ,@"MaxId":maxid};
    [[NetRequestTool sharedRequest] request:param URL:AddApi success:success fail:fail];


}
//发送发送反馈意见
+(void)sendAddviseWithFB_Content:(NSString *)FB_Content FB_BoardOrderNum:(NSString *)FB_BoardOrderNum FB_ClientMgmtId:(NSString *)FB_ClientMgmtId  FB_CmpId :(NSString *)FB_CmpId FB_CmpNm:(NSString *)FB_CmpNm Suecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"method":@"InFeedBack",@"FB_Content":FB_Content,@"FB_BoardOrderNum":FB_BoardOrderNum,@"FB_ClientMgmtId":FB_ClientMgmtId,@"FB_CmpId":FB_CmpId ,@"FB_CmpNm":FB_CmpNm};
    [[NetRequestTool sharedRequest] request:param URL:AddApi success:success fail:fail];

}

//滚动图
+(void)GetDataFromMainViewSuecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
  
    [[NetRequestTool sharedRequest] request:nil URL:picApi success:success fail:fail];
}

// 帅选
+(void)selectListWithDic:(NSDictionary *)dic Suecss:(void (^)(NSArray *))success fail:(void (^)())fail{
    //    NSDictionary * param = @{@"method":@"UpClient",@"Cmgt_Id":Cmgt_Id,@"Cmgt_CmpNm":Cmgt_CmpNm,@"Cmgt_CmpNmAbbreviation":Cmgt_CmpNmAbbreviation,@"Cmgt_PNm":Cmgt_PNm,@"Cmgt_PTel":Cmgt_PTel,@"Cmgt_PMobile":Cmgt_PMobile,@"Cmgt_Pwd":Cmgt_Pwd};
    [[NetRequestTool sharedRequest] request:dic URL:PaperBoardAPI success:success fail:fail];
}
//退补货
+(void)GetRefundReplenishment:(NSString *)code webcode:(NSString *)webcode  Suecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"method":@"GetRefundReplenishment",@"code":code,@"webcode":webcode};
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
    
}
//版本升级
+(void)getVersionSuecss:(void (^)(NSDictionary *))success fail:(void (^)())fail
{
   //  [[NetRequestTool sharedRequest] request:nil URL:VersionStr success:success fail:fail];
    
}
//确认订单
+(void)addPaperBoardTempOrderToBoardOrderWithPBID:(NSString *)pbid Suecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"method":@"addPaperBoardTempOrderToBoardOrder",@"PBDO_Id":pbid};
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
    
}
//购物车列表条数
+(void)tempPaperBoardCountWithCmgt_Id:(NSString *)Cmgt_Id Suecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"method":@"tempPaperBoardCount",@"Cmgt_Id":Cmgt_Id};
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
    
    
}
//批量确认订单
+(void)addPaperBoardTempOrderToBoardOrderPLWithPBID:(NSString *)pbid Suecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"method":@"AddPaperBoardTempOrderToBoardOrderPL",@"PBDO_Id":pbid};
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
    
}
//删除购物车订单
+(void)delePaperBoardTempOrderToBoardOrderPLWithPBID:(NSString *)pbid Suecss:(void (^)(NSArray *))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"method":@"delPaperTempOrder",@"PBDO_Id":pbid};
    [[NetRequestTool sharedRequest] request:param URL:PaperBoardAPI success:success fail:fail];
    
}









@end
