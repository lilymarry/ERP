

#import "NetRequestTool.h"
//#import <AFHTTPRequestOperationManager.h>
#import <AFNetworking.h>
#import "URL.h"
@implementation NetRequestTool
//{
//    AFHTTPRequestOperationManager *_manager;
//    NSOperationQueue *_queue;
//}
-(AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 超时时间
    manager.requestSerializer.timeoutInterval = 30;
    
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    //  manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    
    // 声明获取到的数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    return manager;
}
+(NetRequestTool*)sharedRequest
{
    static NetRequestTool *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[NetRequestTool alloc] init];
    });
    return _sharedManager;
    
}
#pragma 通用请求 加密

-(void)request:(NSDictionary *)parm URL:(NSString *)url success:(void (^)(id))success fail:(void (^)())fail
{
    
    AFHTTPSessionManager *manager = [self manager];
 //   NSMutableString *str1=[NSMutableString string];
//    NSArray *arr=parm.allKeys;
//    for (int i=0 ;i<arr.count ;i++) {
//        
//        [str1 appendString:arr[i]];
//        [str1 appendString:@"="];
//        [str1 appendString:parm[arr[i]]];
//        if (i!=arr.count-1) {
//             [str1 appendString:@"&"];
//        }
//       
//        
//        
//    }
//    NSLog(@"______   %@",[NSString stringWithFormat:@"%@?%@",url,str1]);
    
  [manager GET:url parameters:parm progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
            NSString *aString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSString *urlencodeStr=[aString  stringByReplacingOccurrencesOfString:@"+" withString:@" "];
            NSString *str =[urlencodeStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
            
            NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
            
            id  arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (arr) {
                success(arr);
            }
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        fail();
    }];
    
}
-(void)requestCommon:(NSDictionary *)parm URL:(NSString *)url success:(void (^)(id))success fail:(void (^)())fail
{
    
    AFHTTPSessionManager *manager = [self manager];
    
    [manager GET:url parameters:parm progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
            id  arr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if (arr) {
                success(arr);
            }
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        fail();
    }];
    
}
//带有上传一张图片的请求
-(void)request:(NSDictionary *)parm URL:(NSString *)url imageData:(NSData*)imgData  success:(void (^)(id))success fail:(void (^)())fail
{
    AFHTTPSessionManager *manager = [self manager];
    
    
    [manager POST:url parameters:parm constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /******** 1.上传已经获取到的img *******/
        // 把图片转换成data
        //   NSData *data = UIImagePNGRepresentation(upImg);
        // 拼接数据到请求题中
        if (imgData) {
            [formData appendPartWithFileData:imgData name:@"img" fileName:@"1.jpg" mimeType:@"image/jpeg"];
        }
        // [formData appendPartWithFileData:imgData name:@"file" fileName:@"123.png" mimeType:@"image/png"];
        /******** 2.通过路径上传沙盒或系统相册里的图片 *****/
        //        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" fileName:@"1234.png" mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 打印上传进度
       // NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        // NSLog(@"请求成功：%@",responseObject);
        if(responseObject){
            NSString *aString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSString *urlencodeStr=[aString  stringByReplacingOccurrencesOfString:@"+" withString:@" "];
            NSString *str =[urlencodeStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
            
            NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
            
            id  arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (arr) {
                success(arr);
            }
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        //   NSLog(@"请求失败：%@",error);
        fail();
    }];
    
}


-(void)request:(NSDictionary *)parm URL:(NSString *)url imageData:(NSData*)imgData  soundData :(NSData *)voi success:(void (^)(id))success fail:(void (^)())fail
{
    
    
    AFHTTPSessionManager *manager = [self manager];
    
    
    [manager POST:url parameters:parm constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /******** 1.上传已经获取到的img *******/
        // 把图片转换成data
        //   NSData *data = UIImagePNGRepresentation(upImg);
        // 拼接数据到请求题中
        if (imgData) {
            [formData appendPartWithFileData:imgData name:@"Pic" fileName:@"1.jpg" mimeType:@"image/jpeg"];
            
        }
        if (voi) {
            [formData appendPartWithFileData:voi name:@"Voi" fileName:@"1.wmv" mimeType:@"video/x-ms-wmv"];
        }
        // [formData appendPartWithFileData:imgData name:@"file" fileName:@"123.png" mimeType:@"image/png"];
        /******** 2.通过路径上传沙盒或系统相册里的图片 *****/
        //        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" fileName:@"1234.png" mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 打印上传进度
       // NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        //  NSLog(@"请求成功：%@",responseObject);
        if(responseObject){
            NSString *aString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSString *urlencodeStr=[aString  stringByReplacingOccurrencesOfString:@"+" withString:@" "];
            NSString *str =[urlencodeStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
            
            NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
            
            id  arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (arr) {
                success(arr);
            }
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        // NSLog(@"请求失败：%@",error);
        fail();
    }];
    
}

#pragma  登陆
-(void)requestLogin:(NSString *)username andPassword:(NSString *)password success:(void (^)(NSArray*))success fail:(void (^)())fail
{
    NSDictionary * param = @{@"jNum":username,@"pwd":password,@"method":@"login"};
    [self request:param URL:kLogin_API success:[success copy] fail:[fail copy]];
}
#pragma  修改密码
-(void)requestUpdataPw:(NSString *)uName newPw:(NSString *)aNewPw success:(void (^)(NSArray*))success fail:(void (^)())fail
{
    [self request:@{@"uid":uName,@"pwd":aNewPw,@"method":@"rePwd"} URL:kUpdatePw_API success:[success copy] fail:[fail copy]];
}

#pragma 退出
-(void)requestsignout:(NSString *)uid success:(void (^)(NSArray*))success fail:(void (^)())fail
{
    [self request:@{@"uid":uid,@"method":@"Close"} URL:kSignout_API success:[success copy] fail:[fail copy]];
}
#pragma 版本查询FIR
//-(void)requestVersionFromFIRsuccess:(void (^)(NSDictionary *))success fail:(void (^)())fail{
//    [self request:nil URL:versionChkUrl success:success fail:fail];
//}

-(void)requestVersionFromURLsuccess:(void (^)(NSArray*))success fail:(void (^)())fail;
{
    
  //  [self request:nil URL:kVersion_API success:success fail:fail];
}
-(void)requestLineState:(NSString *)uid success:(void (^)(NSArray*))success fail:(void (^)())fail
{
    [self request:@{@"uid":uid,@"method":@"xintiao"} URL:klineState_API success:[success copy] fail:[fail copy]];


}


@end
