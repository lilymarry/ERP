//
//  CaiZhiModel.m
//  OA_Box
//
//  Created by imac-1 on 2017/4/13.
//  Copyright © 2017年 魏艳丽. All rights reserved.
//

#import "CaiZhiModel.h"

@implementation CaiZhiModel

// 当一个对象要保存到文件中的时候回调用如下方法，所以重写该方法，说明保存该对象的时候要保存哪些属性。
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.idstr forKey:@"id"];
    
    [aCoder encodeObject:self.PB_Nm forKey:@"PB_Nm"];
    [aCoder encodeObject:self.PB_Id forKey:@"PB_Id"];
    
    [aCoder encodeObject:self.PB_TypId forKey:@"PB_TypId"];
    [aCoder encodeObject:self.PB_TypNm forKey:@"PB_TypNm"];
    
    [aCoder encodeObject:self.PB_I_PeId forKey:@"PB_I_PeId"];
    [aCoder encodeObject:self.PB_I_PeNm forKey:@"PB_I_PeNm"];
    [aCoder encodeObject:self.PB_I_Way forKey:@"PB_I_Way"];
    
    [aCoder encodeObject:self.PB_II_PeId forKey:@"PB_II_PeId"];
    [aCoder encodeObject:self.PB_II_PeNm forKey:@"PB_II_PeNm"];
    [aCoder encodeObject:self.PB_II_Way forKey:@"PB_II_Way"];

   
    [aCoder encodeObject:self.PB_III_PeId forKey:@"PB_III_PeId"];
    [aCoder encodeObject:self.PB_III_PeNm forKey:@"PB_III_PeNm"];
    [aCoder encodeObject:self.PB_III_Way forKey:@"PB_III_Way"];
    
    [aCoder encodeObject:self.PB_IV_PeId forKey:@"PB_IV_PeId"];
    [aCoder encodeObject:self.PB_IV_PeNm forKey:@"PB_IV_PeNm"];
    [aCoder encodeObject:self.PB_IV_Way forKey:@"PB_IV_Way"];
    
    [aCoder encodeObject:self.PB_V_PeId forKey:@"PB_V_PeId"];
    [aCoder encodeObject:self.PB_V_PeNm forKey:@"PB_V_PeNm"];
    [aCoder encodeObject:self.PB_V_Way forKey:@"PB_V_Way"];
    
    [aCoder encodeObject:self.PB_VI_PeId forKey:@"PB_VI_PeId"];
    [aCoder encodeObject:self.PB_VI_PeNm forKey:@"PB_VI_PeNm"];
    [aCoder encodeObject:self.PB_VI_Way forKey:@"PB_VI_Way"];
    
    [aCoder encodeObject:self.PB_VII_PeId forKey:@"PB_VII_PeId"];
    [aCoder encodeObject:self.PB_VII_PeNm forKey:@"PB_VII_PeNm"];
    [aCoder encodeObject:self.PB_VII_Way forKey:@"PB_VII_Way"];
    
    
    
    
    [aCoder encodeObject:self.PB_Work_Price forKey:@"PB_Work_Price"];
    [aCoder encodeObject:self.PB_SHORT_LX forKey:@"PB_SHORT_LX"];
    
    [aCoder encodeObject:self.zhilei forKey:@"zhilei"];
    
    [aCoder encodeObject:self.PBDO_I_PmId forKey:@"PBDO_I_PmId"];
    [aCoder encodeObject:self.PBDO_I_PmNm forKey:@"PBDO_I_PmNm"];
    [aCoder encodeObject:self.PBDO_I_PmCode forKey:@"PBDO_I_PmCode"];
    
    [aCoder encodeObject:self.PBDO_II_PmId forKey:@"PBDO_II_PmId"];
    [aCoder encodeObject:self.PBDO_II_PmNm forKey:@"PBDO_II_PmNm"];
    [aCoder encodeObject:self.PBDO_II_PmCode forKey:@"PBDO_II_PmCode"];
    
    [aCoder encodeObject:self.PBDO_III_PmId forKey:@"PBDO_III_PmId"];
    [aCoder encodeObject:self.PBDO_III_PmNm forKey:@"PBDO_III_PmNm"];
    [aCoder encodeObject:self.PBDO_III_PmCode forKey:@"PBDO_III_PmCode"];
    
    [aCoder encodeObject:self.PBDO_IV_PmId forKey:@"PBDO_IV_PmId"];
    [aCoder encodeObject:self.PBDO_IV_PmNm forKey:@"PBDO_IV_PmNm"];
    [aCoder encodeObject:self.PBDO_IV_PmCode forKey:@"PBDO_IV_PmCode"];
    
    [aCoder encodeObject:self.PBDO_V_PmId forKey:@"PBDO_V_PmId"];
    [aCoder encodeObject:self.PBDO_V_PmNm forKey:@"PBDO_V_PmNm"];
    [aCoder encodeObject:self.PBDO_V_PmCode forKey:@"PBDO_V_PmCode"];
    
    [aCoder encodeObject:self.PBDO_VI_PmId forKey:@"PBDO_VI_PmId"];
    [aCoder encodeObject:self.PBDO_VI_PmNm forKey:@"PBDO_VI_PmNm"];
    [aCoder encodeObject:self.PBDO_VI_PmCode forKey:@"PBDO_VI_PmCode"];
    
    [aCoder encodeObject:self.PBDO_VII_PmId forKey:@"PBDO_VII_PmId"];
    [aCoder encodeObject:self.PBDO_VII_PmNm forKey:@"PBDO_VII_PmNm"];
    [aCoder encodeObject:self.PBDO_VII_PmCode forKey:@"PBDO_VII_PmCode"];

    
}

// 当一个对象从文件中读取的时候，系统会调用该方法，重写该方法
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ([super init]) {
        self.idstr = [aDecoder decodeObjectForKey:@"id"];
        self.PB_Id=[aDecoder decodeObjectForKey:@"PB_Id"];
        self.PB_Nm=[aDecoder decodeObjectForKey:@"PB_Nm"];
        
        self.PB_TypId=[aDecoder decodeObjectForKey:@"PB_TypId"];
        self.PB_TypNm=[aDecoder decodeObjectForKey:@"PB_TypNm"];

        
        
        self.PB_I_PeId=[aDecoder decodeObjectForKey:@"PB_I_PeId"];
        self.PB_I_PeNm=[aDecoder decodeObjectForKey:@"PB_I_PeNm"];
        self.PB_I_Way=[aDecoder decodeObjectForKey:@"PB_I_Way"];
        
        self.PB_II_PeId=[aDecoder decodeObjectForKey:@"PB_II_PeId"];
        self.PB_II_PeNm=[aDecoder decodeObjectForKey:@"PB_II_PeNm"];
        self.PB_II_Way=[aDecoder decodeObjectForKey:@"PB_II_Way"];
        
        self.PB_III_PeId=[aDecoder decodeObjectForKey:@"PB_III_PeId"];
        self.PB_III_PeNm=[aDecoder decodeObjectForKey:@"PB_III_PeNm"];
        self.PB_III_Way=[aDecoder decodeObjectForKey:@"PB_III_Way"];
        
        self.PB_IV_PeId=[aDecoder decodeObjectForKey:@"PB_IV_PeId"];
        self.PB_IV_PeNm=[aDecoder decodeObjectForKey:@"PB_IV_PeNm"];
        self.PB_IV_Way=[aDecoder decodeObjectForKey:@"PB_IV_Way"];
        
        self.PB_V_PeId=[aDecoder decodeObjectForKey:@"PB_V_PeId"];
        self.PB_V_PeNm=[aDecoder decodeObjectForKey:@"PB_V_PeNm"];
        self.PB_V_Way=[aDecoder decodeObjectForKey:@"PB_V_Way"];
        
        self.PB_VI_PeId=[aDecoder decodeObjectForKey:@"PB_VI_PeId"];
        self.PB_VI_PeNm=[aDecoder decodeObjectForKey:@"PB_VI_PeNm"];
        self.PB_VI_Way=[aDecoder decodeObjectForKey:@"PB_VI_Way"];
        
        self.PB_VII_PeId=[aDecoder decodeObjectForKey:@"PB_VII_PeId"];
        self.PB_VII_PeNm=[aDecoder decodeObjectForKey:@"PB_VII_PeNm"];
        self.PB_VII_Way=[aDecoder decodeObjectForKey:@"PB_VII_Way"];
        
        
        self.PB_Work_Price=[aDecoder decodeObjectForKey:@"PB_Work_Price"];
        self.PB_SHORT_LX=[aDecoder decodeObjectForKey:@"PB_SHORT_LX"];
        self.zhilei=[aDecoder decodeObjectForKey:@"zhilei"]; 
        
        self.PBDO_I_PmCode=[aDecoder decodeObjectForKey:@"PBDO_I_PmCode"];
        self.PBDO_I_PmId=[aDecoder decodeObjectForKey:@"PBDO_I_PmId"];
        self.PBDO_I_PmNm=[aDecoder decodeObjectForKey:@"PBDO_I_PmNm"];
        
        
        self.PBDO_II_PmId=[aDecoder decodeObjectForKey:@"PBDO_II_PmId"];
        self.PBDO_II_PmNm=[aDecoder decodeObjectForKey:@"PBDO_II_PmNm"];
        self.PBDO_II_PmCode=[aDecoder decodeObjectForKey:@"PBDO_II_PmCode"];
        
        
        self.PBDO_III_PmId=[aDecoder decodeObjectForKey:@"PBDO_III_PmId"];
        self.PBDO_III_PmNm=[aDecoder decodeObjectForKey:@"PBDO_III_PmNm"];
        self.PBDO_III_PmCode=[aDecoder decodeObjectForKey:@"PBDO_III_PmCode"];
        
        self.PBDO_IV_PmId=[aDecoder decodeObjectForKey:@"PBDO_IV_PmId"];
        self.PBDO_IV_PmNm=[aDecoder decodeObjectForKey:@"PBDO_IV_PmNm"];
        self.PBDO_IV_PmCode=[aDecoder decodeObjectForKey:@"PBDO_IV_PmCode"];
        
        self.PBDO_V_PmId=[aDecoder decodeObjectForKey:@"PBDO_V_PmId"];
        self.PBDO_V_PmNm=[aDecoder decodeObjectForKey:@"PBDO_V_PmNm"];
        self.PBDO_V_PmCode=[aDecoder decodeObjectForKey:@"PBDO_V_PmCode"];
        
        self.PBDO_VI_PmId=[aDecoder decodeObjectForKey:@"PBDO_VI_PmId"];
        self.PBDO_VI_PmNm=[aDecoder decodeObjectForKey:@"PBDO_VI_PmNm"];
        self.PBDO_VI_PmCode=[aDecoder decodeObjectForKey:@"PBDO_VI_PmCode"];
        
        self.PBDO_VII_PmId=[aDecoder decodeObjectForKey:@"PBDO_VII_PmId"];
        self.PBDO_VII_PmNm=[aDecoder decodeObjectForKey:@"PBDO_VII_PmNm"];
        self.PBDO_VII_PmCode=[aDecoder decodeObjectForKey:@"PBDO_VII_PmCode"];
    }
    return self;
}
@end
