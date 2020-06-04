
#import <Foundation/Foundation.h>

@interface NetRequestTool : NSObject
+(NetRequestTool*)sharedRequest;

-(void)request:(NSDictionary *)parm URL:(NSString *)url success:(void (^)(id))success fail:(void (^)())fail;
-(void)requestCommon:(NSDictionary *)parm URL:(NSString *)url success:(void (^)(id))success fail:(void (^)())fail;

-(void)request:(NSDictionary *)parm URL:(NSString *)url imageData:(NSData*)imgData  success:(void (^)(id))success fail:(void (^)())fail;
// 登录
-(void)requestLogin:(NSString *)username andPassword:(NSString *)password success:(void(^)(NSArray *userInfo))success fail:(void(^)())fail;

// 修改密
-(void)requestUpdataPw:(NSString *)uName newPw:(NSString *)aNewPw success:(void (^)(NSArray*))success fail:(void (^)())fail;

-(void)request:(NSDictionary *)parm URL:(NSString *)url imageData:(NSData*)imgData  soundData :(NSData *)voi success:(void (^)(id))success fail:(void (^)())fail;

//退出
-(void)requestsignout:(NSString *)uid success:(void (^)(NSArray*))success fail:(void (^)())fail;

////检测版本 fir
//-(void)requestVersionFromFIRsuccess:(void (^)(NSDictionary*))success fail:(void (^)())fail;
-(void)requestVersionFromURLsuccess:(void (^)(NSArray*))success fail:(void (^)())fail;

-(void)requestLineState:(NSString *)uid success:(void (^)(NSArray*))success fail:(void (^)())fail;


@end
