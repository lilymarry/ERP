//
//  FeeBackModel.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/25.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeeBackModel : NSObject
//"FB_BoardOrderNum" = 98705116;
//"FB_CmpId" = 1;
//"FB_CmpNm" = "\U534f\U65ed\U79d1\U6280";
//"FB_CompleteDate" = "";
//"FB_ConductDate" = "";
//"FB_Content" = "\U53cd\U9988\U7684\U5185\U5bb9\U6d4b\U8bd5";
//"FB_Id" = 5;
//"FB_Reply" = "";
//"FB_SubmitDate" = "2016/10/25 16:20:25";
//"FB_Type" = 1;
@property(copy,nonatomic)NSString *FB_BoardOrderNum;
@property(copy,nonatomic)NSString *FB_CmpId;
@property(copy,nonatomic)NSString *FB_CmpNm;
@property(copy,nonatomic)NSString *FB_CompleteDate;
@property(copy,nonatomic)NSString *FB_ConductDate;
@property(copy,nonatomic)NSString *FB_Content;
@property(copy,nonatomic)NSString *FB_Id;
@property(copy,nonatomic)NSString *FB_Reply;
@property(copy,nonatomic)NSString *FB_SubmitDate;
@property(copy,nonatomic)NSString *FB_Type;
-(instancetype)initWithDic:(NSDictionary *)dict;
@end
