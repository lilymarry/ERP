#ifndef Re_OA_URL_h
#define Re_OA_URL_h

#endif

#pragma mark 外网端口


//局域网测试
//#define kDomain @"http://192.168.0.253:4000" //数据表
//#define kDomain @"http://192.168.0.253:8011"//下单测试
//#define kDomain @"http://192.168.0.253:1000"//下单测试
//#define kDomain @"http://192.168.0.253"



//大城旭阳纸业
//#define kDomain @"https://dachengerp.xiexukj.com/"
//#define dituKey @"hZE8RrlxcTf0qdZwfeppCizMddaFEdDF"
//#define JpuchKey @"74328c87caf376d4d931212c"


//民盛纸业
//#define kDomain @"https://minshengerp.xiexukj.com"
#define kDomain @"http://218.241.17.97:5016"
#define dituKey @"zSxmp77dKUOc9gVyTmeGZSd8KHeWqGcG"
#define JpuchKey @"ce47ca899d03c5d52f39fddb"


//大厂纸业
//#define kDomain @"https://dachangerp.xiexukj.com"
//#define kDomain @"http://218.241.17.97:5006"
//#define dituKey @"tFtaX7UnLMBbmVInluGiGVQ2j5soaXuE"
//#define JpuchKey @"ef5b490143f051c0ad40cf96"


//旭阳纸业
//#define kDomain @"https://ningheerp.xiexukj.com"
//#define kDomain @"http://218.241.17.97:5022"
//#define dituKey @"2jeUhv1DoDt1IQ8FuTbQk5rfN32RdTKl"
//#define JpuchKey @"6fc133094589b0fee5b9d8d5"


//兴阳包装纸业
//#define kDomain @"https://xingyangerp.xiexukj.com"
//#define dituKey @"DK4vBfDcaRcNsXPGzo5QEwLk4LvG8t5Z"
//#define JpuchKey @"b7decd9dffbe926f5cc8a5cd"







//纸业帮
//#define kDomain @"http://221.122.101.109:8089"
//#define kDomain @"https://csbuy.xiexukj.com/"
//#define dituKey @"VsptjrPrMt712F6hmmc9Uu2PZXnfv1td"
//#define JpuchKey @""



//旭阳纸业
//#define kDomain @"https://ningheerp.xiexukj.com"
//#define dituKey @"VsptjrPrMt712F6hmmc9Uu2PZXnfv1td"
//#define JpuchKey @""


   

#pragma mark ------------------------------------------------------------------------
//登陆 
#define kLogin_API [NSString stringWithFormat:@"%@/Wap/WapUserHandler.ashx",kDomain]
//修改密码
#define kUpdatePw_API [NSString stringWithFormat:@"%@/Wap/WapUserHandler.ashx?",kDomain]
//退出
#define kSignout_API [NSString stringWithFormat:@"%@/Wap/WapUserHandler.ashx?",kDomain]

//在线状态
#define klineState_API [NSString stringWithFormat:@"%@/Wap/WapGeneralReminderHandler.ashx?",kDomain]


//获取视频IP
#define kGetIP_API [NSString stringWithFormat:@"%@/Wap/WapIPHandler.ashx",kDomain]











