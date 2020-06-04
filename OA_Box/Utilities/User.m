//
//  User.m
//  Re-OA
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 姜任鹏. All rights reserved.
//

#import "User.h"
static User *user;
@implementation User
+ (User *)standartUserInfo
{
    if (!user)
    {
        user = [[User alloc] init];
        
    }
    return  user;
}
//-(void)setInfoArr:(NSArray *)infoArr
//{
//    self.Cmgt_Id = [infoArr[0] objectForKey:@"Cmgt_Id "];
//  
//}
@end
