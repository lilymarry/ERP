//
//  User.h
//  Re-OA
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompanyModel.h"
@interface User : NSObject
@property (strong, nonatomic) NSString *Cmgt_Id;

@property (strong, nonatomic) NSString *Cmgt_CmpNmAbbreviation;

@property (strong, nonatomic) NSString *Cmgt_CmpNm;

@property (strong, nonatomic) NSString *Cmgt_PMobile;
@property (strong, nonatomic) NSString *Cmgt_PNm;

@property (strong, nonatomic) NSString *Cmgt_PTel;
@property (strong, nonatomic) NSString *Cmgt_CustomerCode;
@property (strong, nonatomic) CompanyModel *model;
@property (strong, nonatomic) NSString *IsSinglePlant;

+ (User *) standartUserInfo;
@end
