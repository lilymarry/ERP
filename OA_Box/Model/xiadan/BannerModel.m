//
//  BannerModel.m
//  OA_Box
//
//  Created by imac-1 on 2016/10/26.
//  Copyright © 2016年 魏艳丽. All rights reserved.
//

#import "BannerModel.h"

@implementation BannerModel
-(instancetype)initWithDic:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.BA_Img=dict[@"BA_Img"];
        self.BA_Url=dict[@"BA_Url"];

    }
    return self;
}
@end
