//
//  CompanyModel.h
//  Re-OA
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyModel : NSObject
@property(copy,nonatomic)NSString *Jcmp_Id;
@property(copy,nonatomic)NSString *Jcmp_Code;
@property(copy,nonatomic)NSString *Jcmp_Nm;

@property(copy,nonatomic)NSString *Jcmp_MinWidth;
@property(copy,nonatomic)NSString *Jcmp_MaxWidth;
@property(copy,nonatomic)NSString *Jcmp_MinLength;
@property(copy,nonatomic)NSString *Jcmp_MaxLength;
@property(copy,nonatomic)NSString *Jcmp_MinDate;
-(instancetype)initWithDic:(NSDictionary *)dict;
@end
