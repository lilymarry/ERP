//
//  XiaDanFlowModel.h
//  Re-OA
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XiaDanFlowModel : NSObject
///// 订单轨迹ID
///// </summary>
//@property(copy,nonatomic)NSString *  POL_Id ;
///// <summary>
///// 订单ID
///// </summary>
//@property(copy,nonatomic)NSString *  POL_Oid ;
///// <summary>
/////订单类型KEY
///// </summary>
//@property(copy,nonatomic)NSString *  POL_TPKey ;
///// <summary>
/////订单类型名称
///// </summary>
//@property(copy,nonatomic)NSString * POL_TPNm ;
///// <summary>
///// 订单参数一标题
///// </summary>
//@property(copy,nonatomic)NSString * POL_Yi_Tit;
///// <summary>
///// 订单参数一内容
///// </summary>
//@property(copy,nonatomic)NSString *  POL_Yi_Con ;
///// <summary>
///// 订单参数二标题
///// </summary>
//@property(copy,nonatomic)NSString *  POL_Er_Tit ;
///// <summary>
///// 订单参数二内容
///// </summary>
//@property(copy,nonatomic)NSString *  POL_Er_Con ;
///// <summary>
///// 订单参数三标题
///// </summary>
//@property(copy,nonatomic)NSString *  POL_San_Tit ;
///// <summary>
///// 订单参数三内容
///// </summary>
//@property(copy,nonatomic)NSString *  POL_San_Con ;
///// <summary>
///// 操作人UID
///// </summary>
//@property(copy,nonatomic)NSString *  POL_Do_Pid ;
///// <summary>
///// 操作人姓名
///// </summary>
//@property(copy,nonatomic)NSString *  POL_Do_PNm;
///// <summary>
///// 参数表单
///// </summary>
//@property(copy,nonatomic)NSString *  POL_FormJson ;
///// <summary>
///// 创建时间
///// </summary>
//@property(copy,nonatomic)NSString *  crt_tm ;


@property(copy,nonatomic)NSString *  SID ;
/// <summary>
/// 订单参数三内容
/// </summary>
@property(copy,nonatomic)NSString *  OrderCode ;
/// <summary>
/// 操作人UID
/// </summary>
@property(copy,nonatomic)NSString *  OrderCodeWeb ;
/// <summary>
/// 操作人姓名
/// </summary>
@property(copy,nonatomic)NSString *  State;
/// <summary>
/// 参数表单
/// </summary>
@property(copy,nonatomic)NSString *  Remark ;
/// <summary>
/// 创建时间
/// </summary>
@property(copy,nonatomic)NSString *  SetTime ;

-(instancetype)initWithDic:(NSDictionary *)dict;
@end
