//
//  TuiHuoModel.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/28.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuiHuoModel : NSObject
@property(copy,nonatomic)NSString *Amount;
@property(copy,nonatomic)NSString *Code ;
@property(copy,nonatomic)NSString *CustomCode ;
@property(copy,nonatomic)NSString *Date ;
@property(copy,nonatomic)NSString *DeliveryCode ;
@property(copy,nonatomic)NSString *Freight ;
@property(copy,nonatomic)NSString *FreightSquare ;
@property(copy,nonatomic)NSString *Money ;
@property(copy,nonatomic)NSString *OrderCode ;
@property(copy,nonatomic)NSString *PricePaperBoard ;
@property(copy,nonatomic)NSString *Reason;
@property(copy,nonatomic)NSString *ZHJG;
-(instancetype)initWithDic:(NSDictionary *)dict;
@end
