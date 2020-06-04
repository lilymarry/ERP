//
//  XiaDanListModel.h
//  Re-OA
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XiaDanListModel : NSObject
/// <summary>
/// 自动标识
/// </summary>
@property(copy,nonatomic)NSString * PBDO_Id ;
@property(copy,nonatomic)NSString * PBDO_PBId ;
/// <summary>
/// 客户ID
/// </summary>
@property(copy,nonatomic)NSString *PBDO_ClientId;
/// <summary>
/// 客户名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_ClientNm ;
/// <summary>
/// 所选厂区ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_CmpId ;
/// <summary>
/// 所选厂区名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_CmpNm ;
/// <summary>
/// 订单状态关键字
/// </summary>
@property(copy,nonatomic)NSString * PBDO_POST_Key ;
/// <summary>
/// 订单状态名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_POST_Nm;
/// <summary>
/// 采购单号
/// </summary>
@property(copy,nonatomic)NSString * PBDO_BuyCode ;
/// <summary>
/// 纸板类型ID
/// </summary>
//@property(copy,nonatomic)NSString * PBDO_PBId ;
/// <summary>
/// 纸板类型名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_PBNm;


/// <summary>
/// 材质一层材质ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_I_PmId ;
/// <summary>
/// 材质一层材质名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_I_PmNm;
/// <summary>
/// 材质二层材质ID
/// </summary>
@property(copy,nonatomic)NSString *PBDO_II_PmId ;
/// <summary>
/// 材质二层材质名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_II_PmNm;
/// <summary>
/// 材质三层材质ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_III_PmId ;
/// 材质三层材质名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_III_PmNm;
/// <summary>
/// 材质四层材质ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_IV_PmId ;
/// <summary>
/// 材质四层材质名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_IV_PmNm;
/// <summary>
/// 材质五层材质ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_V_PmId ;
/// <summary>
/// 材质五层材质名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_V_PmNm ;
/// <summary>
/// 材质六层材质ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_VI_PmId ;
/// <summary>
/// 材质六层材质名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_VI_PmNm ;
/// <summary>
/// 材质七层材质ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_VII_PmId ;
/// <summary>
/// 材质七层材质名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_VII_PmNm ;


/// <summary>
/// 长
/// </summary>
@property(copy,nonatomic)NSString * PBDO_Long ;
/// <summary>
/// 宽
/// </summary>
@property(copy,nonatomic)NSString * PBDO_Width ;
/// <summary>
/// 购买数量
/// </summary>
@property(copy,nonatomic)NSString * PBDO_BuyNum;


/// <summary>
/// 压线1
/// </summary>
@property(copy,nonatomic)NSString * PBDO_I_line ;
/// <summary>
/// 压线2
/// </summary>
@property(copy,nonatomic)NSString * PBDO_II_line ;
/// <summary>
/// 压线3
/// </summary>
@property(copy,nonatomic)NSString * PBDO_III_line ;
/// <summary>
/// 压线4
/// </summary>
@property(copy,nonatomic)NSString * PBDO_IV_line ;
/// <summary>
/// 压线5
/// </summary>
@property(copy,nonatomic)NSString * PBDO_V_line ;
/// <summary>
/// 压线6
/// </summary>
@property(copy,nonatomic)NSString * PBDO_VI_line ;
/// <summary>
/// 压线7
/// </summary>
@property(copy,nonatomic)NSString * PBDO_VII_line ;
/// <summary>
/// 压线8
/// </summary>
@property(copy,nonatomic)NSString * PBDO_VIII_line ;


/// <summary>
/// 压型ID
/// </summary>
@property(copy,nonatomic)NSString * PBDO_PPTid ;
/// <summary>
/// 压型名称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_PPTnm;
/// <summary>
/// 交期
/// </summary>
@property(copy,nonatomic)NSString * PBDO_DeliveryTm ;
/// <summary>
/// 注意事项
/// </summary>
@property(copy,nonatomic)NSString * PBDO_Note ;

/// <summary>
/// 起始时间
/// </summary>
@property(copy,nonatomic)NSString *PBDO_start_tm ;
/// <summary>
/// 结束时间
/// </summary>
@property(copy,nonatomic)NSString * PBDO_over_tm ;



/// <summary>
/// 公司简称
/// </summary>
@property(copy,nonatomic)NSString * PBDO_ClientNmAbbreviation;
/// <summary>
/// 订单号
/// </summary>
@property(copy,nonatomic)NSString * PBDO_OrderCode ;
/// <summary>
/// 楞行
/// </summary>
@property(copy,nonatomic)NSString * PBDO_PBCorrugatedLine ;

/// <summary>
/// 净板
/// </summary>
@property(copy,nonatomic)NSString *PBDO_Plate ;
/// <summary>
/// 纸质
/// </summary>
@property(copy,nonatomic)NSString * PBDO_PaperNumber ;

@property(copy,nonatomic)NSString * isExist;
@property(copy,nonatomic)NSString * state;

@property (assign,nonatomic) BOOL isChild;
@property (assign,nonatomic) BOOL isExpended;

@property(copy,nonatomic)NSString * OrderCode;
//
@property(copy,nonatomic)NSString * ProductionDescription;
@property(copy,nonatomic)NSString * DeliveryNote;

@property(copy,nonatomic)NSString * PBDO_I_PmCode;
@property(copy,nonatomic)NSString * PBDO_II_PmCode;
@property(copy,nonatomic)NSString * PBDO_III_PmCode;
@property(copy,nonatomic)NSString * PBDO_IV_PmCode;
@property(copy,nonatomic)NSString * PBDO_V_PmCode;
@property(copy,nonatomic)NSString * PBDO_VI_PmCode;
@property(copy,nonatomic)NSString * PBDO_VII_PmCode;
@property(nonatomic)BOOL isSeleted;



-(instancetype)initWithDic:(NSDictionary *)dict;
@end
