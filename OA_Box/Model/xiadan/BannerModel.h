//
//  BannerModel.h
//  OA_Box
//
//  Created by imac-1 on 2016/10/26.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject
@property(copy,nonatomic)NSString *BA_Img;
@property(copy,nonatomic)NSString *BA_Url;

-(instancetype)initWithDic:(NSDictionary *)dict;
@end
