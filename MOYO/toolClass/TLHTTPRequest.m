//
//  TLHTTPRequest.m
//  TogetherLu
//
//  Created by Louie on 16/12/19.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "TLHTTPRequest.h"
#import <AVFoundation/AVFoundation.h>

static NSString * key = @"bXuTYRe4kkTdq7SYzKmxKxHr+kHE1u2RigJpiETkGJilH0VayHgzqeET2qAH1W+Gk7you+y2hxNBaJXpDIaZlM+R/4Q0p64Qcv0lQfkBO7/dFpxfrxYKsfZqZLEAbGDtHgeCFzF+OsXYGt7yOTxGMMiI/034AsB9/S5JTsoHlzNgAfQ6/beJzaqcVcoWDt09U4OtbhSZH+fdHaon++n+xA==";

@interface   TLHTTPRequest (manager)

+ (AFHTTPSessionManager *)manager;

@end

@implementation TLHTTPRequest (manager)

+ (AFHTTPSessionManager *)manager{
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *_manager;
    dispatch_once(&onceToken, ^
                  {
                      _manager = [AFHTTPSessionManager manager];
                      //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                      _manager.requestSerializer.timeoutInterval = 10.f;
                      
//                      _manager.requestSerializer = [AFJSONRequestSerializer serializer];
                      _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                      
//                      _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
                      [_manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
                      
                      
//                      [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                      AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
                      //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
                      //如果是需要验证自建证书，需要设置为YES
                      securityPolicy.allowInvalidCertificates = YES;//YES;
                      //validatesDomainName 是否需要验证域名，默认为YES；
                      //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
                      //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
                      //如置为NO，建议自己添加对应域名的校验逻辑。
//                      [_manager.securityPolicy setAllowInvalidCertificates:YES];
                      securityPolicy.validatesDomainName = NO;//YES;//这边可以改yes
                      
                      NSString *cerPath = [[NSBundle mainBundle] pathForResource:CertificatePath ofType:@"cer"];
                      NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
                      
                      NSString *cerPath1 = [[NSBundle mainBundle] pathForResource:@"51moyo_com" ofType:@"cer"];
                      NSData *cerData1 = [NSData dataWithContentsOfFile:cerPath1];

                      securityPolicy.pinnedCertificates = [NSSet setWithObjects:cerData, cerData1, nil];
                      _manager.securityPolicy = securityPolicy;
                  });
    
    if (USERKEY) {
        [_manager.requestSerializer setValue:USERKEY forHTTPHeaderField:@"key"];
    }
    return _manager;
}

@end

static TLHTTPRequest *tlRequest = nil;
@interface TLHTTPRequest ()

//@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation TLHTTPRequest

//  判断审核和正式服  以便于加载 url
+(NSString *)getUrlStringBaseUrl:(NSString*)baseUrl{

    NSString* strUrl;

#ifdef Auditing

    if ([baseUrl isEqualToString:LoginURL] || [baseUrl isEqualToString:AutomaticLoginUrl]) {

        strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];

    }else{

        if (!USERID) { // 正式服优先
            strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
        }else{

            if ([Utility isAuditEnvironment] == NO) {   //非审核 就是正式服
                strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
            }else{
                // 审核服
                strUrl = [NSString stringWithFormat:@"%@%@",Auditing,baseUrl];
            }
        }
    }
#else
//
    strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];

#endif

    return strUrl;
}



//+(void)requestiOSVerision{
//
//    [TLHTTPRequest MY_getWithBaseUrl:GetiOSVersion parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//        if (0 == [data objectForKey:@"ret"]) {
//
//            //  存储版本号
////            info
//        }else{
//
//            if ([data objectForKey:@"msg"]) {
//                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
//            }
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//
//        [LQProgressHud showMessage:@"请求失败，请检查网络"];
//
//    }];
//}


////  判断
//+(NSString *)getUrlStringBaseUrl:(NSString*)baseUrl{
//
//    NSString* strUrl;
//
//    //  如果是 获取 版本号 走正式服
//    if ([baseUrl isEqualToString:GetiOSVersion] ) { //|| [baseUrl isEqualToString:GetCodeURL]
//
//        strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
//
//    }else{ //   如果是其他请求 判断审核 和 正式
//        if ([Utility isAuditEnvironment] == NO) {   //非审核 就是正式服
//            strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
//        }else{
////             审核服
//            strUrl = [NSString stringWithFormat:@"%@%@",Auditing,baseUrl];
//        }
//    }
//    return strUrl;
//}


//  获取正式服 世界平道ID
+(NSString*)getWorldChannelID{
    
    NSString* strUrl;
    if ([Utility isAuditEnvironment] == NO) {   //非审核 就是正式服
        strUrl = @"31498981933059";
        
    }else{                // 审核服                strUrl = [NSString stringWithFormat:@"%@%@",Auditing,baseUrl];
        strUrl = @"30514076516355";
    }
    return strUrl;
}


//关闭所有请求
+ (void)MY_cancelAllHttpRequestByApiPath:(nullable NSString *)path
{
    TLHTTPRequest.manager.operationQueue.suspended = YES;
    [TLHTTPRequest.manager.operationQueue cancelAllOperations];
}


+ (void)MY_postWithBaseUrl:(NSString *)baseUrl
             parameters:(id)parameters
                success:(successCallback)success
                failure:(failureCallback)failure{
    //    [CCMeetListingRequest httpsRequestWithBaseUrl:baseUrl parameters:parameters certificate:@"WIN-18RHFO5T82H" success:success failure:failure];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    NSString* strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
    
    // 判断是否加载审核服
    NSString* strUrl = [self getUrlStringBaseUrl:baseUrl];
    
//  如果有userKey就传
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (parameters) {
        [dict setDictionary:parameters];
    }
//    if (USERKEY) {
//        [dict setObject:USERKEY forKey:@"key"];
//    }
    
    NSString* strModel = [NSString stringWithFormat:@"%@/%@", [Utility getPhoneType],[Utility getphoneVersion]];//手机型号+系统版本
    [dict setObject:strModel forKey:@"model"];
    [dict setObject:[Utility getAppVersion] forKey:@"version"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [dict setObject:uuid forKey:@"deviceId"];
    [dict setObject:@0 forKey:@"plateform"];  //    0 ios   1 android
    
    TLHTTPRequest.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [TLHTTPRequest.manager POST:strUrl parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        NSLog(@"parameters === %@\nrequestURL === %@\n  responeObject == %@",parameters,baseUrl,responseObject);
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
        if ([dic[@"ret"] integerValue] == 0) {
            
            success(task,dic);
        }
        else{
            success(task,dic);
//            [MMProgressHUD dismissWithError:@"请求失败"];
//            NSError *error = [NSError errorWithDomain:[dic objectForKey:@"msg"] code:0 userInfo:nil];
//            NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
//            failure(task,error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"parameters === %@\n         requestURL === %@\n       error == %@",parameters,baseUrl,error);
        failure(task,error);
    }];
}

/**
 *  get请求
 *
 *  @param parameters 参数
 *  @param success    请求成功
 *  @param failure    请求失败
 */
+ (void)MY_getWithBaseUrl:(NSString *)baseUrl
            parameters:(id)parameters
               success:(successCallback)success
               failure:(failureCallback)failure{
    //    [CCMeetListingRequest httpsGetRequestWithBaseUrl:baseUrl parameters:parameters certificate:@"WIN-18RHFO5T82H" success:success failure:failure];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    NSString* strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
    
    // 判断是否加载审核服
    NSString* strUrl = [self getUrlStringBaseUrl:baseUrl];
    
//  如果有userKey就传
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (parameters) {
        [dict setDictionary:parameters];
    }
//    if (USERKEY) {
//        [dict setObject:USERKEY forKey:@"key"];
//    }
    
    NSString* strModel = [NSString stringWithFormat:@"%@/%@", [Utility getPhoneType],[Utility getphoneVersion]];//手机型号+系统版本
    [dict setObject:strModel forKey:@"model"];
    [dict setObject:[Utility getAppVersion] forKey:@"version"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [dict setObject:uuid forKey:@"deviceId"];
    [dict setObject:@0 forKey:@"plateform"];  //    0 ios   1 android
    
    [TLHTTPRequest.manager GET:strUrl parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
        
        if ([dic[@"ret"] integerValue] == 0) {
            success(task,dic);
        }
        else{
            success(task,dic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
        failure(task,error);
    }];
    
}

+ (void)MY_postDataAndImageRequest:(NSString *)baseUrl parameters:(id)parameters imageDataArr:(NSArray *)imageDataArr success:(successCallback)success failure:(failureCallback)failure{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
//    NSString* strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
    // 判断是否加载审核服
    NSString* strUrl = [self getUrlStringBaseUrl:baseUrl];
    
//  如果有userKey就传
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (parameters) {
        [dict setDictionary:parameters];
    }
//    if (USERKEY) {
//        [dict setObject:USERKEY forKey:@"key"];
//    }
    
    NSString* strModel = [NSString stringWithFormat:@"%@/%@", [Utility getPhoneType],[Utility getphoneVersion]];//手机型号+系统版本
    [dict setObject:strModel forKey:@"model"];
    [dict setObject:[Utility getAppVersion] forKey:@"version"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [dict setObject:uuid forKey:@"deviceId"];
    [dict setObject:@0 forKey:@"plateform"];  //    0 ios   1 android
    
    [TLHTTPRequest.manager POST:strUrl parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i <imageDataArr.count; i++) {
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置日期格式
//            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//            NSString *fileName = [formatter stringFromDate:[NSDate date]];
            NSString *nameStr = @"img";
            
            [formData appendPartWithFileData:imageDataArr[i] name:nameStr fileName:[NSString stringWithFormat:@"%@.png",@""] mimeType:@"image/png"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        NSLog(@"`11111111111");
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",dic);
        if ([dic[@"ret"] integerValue] == 0) {
            success(task,dic);
        }
        else{
            
            NSError *error = [NSError errorWithDomain:[dic objectForKey:@"msg"] code:0 userInfo:nil];
            NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
            failure(task,error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
        failure(task,error);
        NSLog(@"`222222222222");
    }];
}


+ (void)MY_postDataAndMoreImagesRequest:(NSString *)baseUrl parameters:(id)parameters imageDataArr:(NSArray *)imageDataArr success:(successCallback)success failure:(failureCallback)failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    NSString* strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
    
    // 判断是否加载审核服
    NSString* strUrl = [self getUrlStringBaseUrl:baseUrl];
    
//  如果有userKey就传
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (parameters) {
        [dict setDictionary:parameters];
    }
//    if (USERKEY) {
//        [dict setObject:USERKEY forKey:@"key"];
//    }
    
    NSString* strModel = [NSString stringWithFormat:@"%@/%@", [Utility getPhoneType],[Utility getphoneVersion]];//手机型号+系统版本
    [dict setObject:strModel forKey:@"model"];
    [dict setObject:[Utility getAppVersion] forKey:@"version"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [dict setObject:uuid forKey:@"deviceId"];
    [dict setObject:@0 forKey:@"plateform"];  //    0 ios   1 android
    
    [TLHTTPRequest.manager POST:strUrl parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i <imageDataArr.count; i++) {

            NSString *nameStr =[NSString stringWithFormat:@"img"];
            
            [formData appendPartWithFileData:imageDataArr[i] name:nameStr fileName:[NSString stringWithFormat:@"%@.png",@""] mimeType:@"image/png"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //        NSLog(@"`11111111111");
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",dic);
        if ([dic[@"ret"] integerValue] == 0) {
            success(task,dic);
        }
        else{
            NSError *error = [NSError errorWithDomain:[dic objectForKey:@"msg"] code:0 userInfo:nil];
            NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
            failure(task,error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
        failure(task,error);
        NSLog(@"`222222222222");
    }];

}



+ (void)MY_postDataOrFillRequest:(NSString *)baseUrl parameters:(id)parameters imageDataArr:(NSData *)imageData success:(successCallback)success failure:(failureCallback)failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
//    NSString* strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,baseUrl];
    // 判断是否加载审核服
    NSString* strUrl = [self getUrlStringBaseUrl:baseUrl];
    
//  如果有userKey就传
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (parameters) {
        [dict setDictionary:parameters];
    }
//    if (USERKEY) {
//        [dict setObject:USERKEY forKey:@"key"];
//    }
    
    NSString* strModel = [NSString stringWithFormat:@"%@/%@", [Utility getPhoneType],[Utility getphoneVersion]];//手机型号+系统版本
    [dict setObject:strModel forKey:@"model"];
    [dict setObject:[Utility getAppVersion] forKey:@"version"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [dict setObject:uuid forKey:@"deviceId"];
    [dict setObject:@0 forKey:@"plateform"];  //    0 ios   1 android
    
    [TLHTTPRequest.manager POST:strUrl parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        
        NSString *nameStr =[NSString stringWithFormat:@"img"];
            
        [formData appendPartWithFileData:imageData name:nameStr fileName:[NSString stringWithFormat:@"%@.png",@""] mimeType:@"image/png"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //        NSLog(@"`11111111111");
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",dic);
        if ([dic[@"ret"] integerValue] == 0) {
            success(task,dic);
        }
        else{
            
            NSError *error = [NSError errorWithDomain:[dic objectForKey:@"msg"] code:0 userInfo:nil];
            NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
            failure(task,error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"parameters === %@\nrequestURL === %@\nerror == %@",parameters,baseUrl,error);
        failure(task,error);
        NSLog(@"`222222222222");
    }];
    
}




+ (void)MY_postToUrlString:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters fileData:(nonnull NSData *)fileData name:(nonnull NSString *)name fileName:(nonnull NSString *)fileName mimeType:(NSInteger)mimeType response:(ResposeStyle)styleR success:(nonnull successCallback)success failure:(nonnull failureCallback)failure{
    //1.获取单例的网络管理对象
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.根据style 的类型 去选择返回值得类型
    switch (styleR) {
        case 1:
            TLHTTPRequest.manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case 2:
            TLHTTPRequest.manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case 3:
            TLHTTPRequest.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    //3.设置相应数据支持的类型
    [TLHTTPRequest.manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil]];
//    NSString* strUrl = [NSString stringWithFormat:@"%@%@",DOMAINNAME,url];
    // 判断是否加载审核服
    NSString* strUrl = [self getUrlStringBaseUrl:url];
    
    
//  如果有userKey就传
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (parameters) {
        [dict setDictionary:parameters];
    }
//    if (USERKEY) {
//        [dict setObject:USERKEY forKey:@"key"];
//    }
    
    NSString* strModel = [NSString stringWithFormat:@"%@/%@", [Utility getPhoneType],[Utility getphoneVersion]];//手机型号+系统版本
    [dict setObject:strModel forKey:@"model"];
    [dict setObject:[Utility getAppVersion] forKey:@"version"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [dict setObject:uuid forKey:@"deviceId"];
    [dict setObject:@0 forKey:@"plateform"];  //    0 ios   1 android
    
    [TLHTTPRequest.manager POST:strUrl parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /*
            mimeType == 0 //图片
            mimeType == 1 //视频
            mimeType == 2 //mp3
         */
        if (mimeType == 0) {
            [formData appendPartWithFileData:fileData name:name fileName:[NSString stringWithFormat:@"%@.png",fileName] mimeType:@"image/png"];
        }
        else if (mimeType == 1)
        {
            [formData appendPartWithFileData:fileData name:name fileName:[NSString stringWithFormat:@"%@.mp4",fileName] mimeType:@"video/mp4"];
        }
        else if (mimeType == 2)
        {
            [formData appendPartWithFileData:fileData name:name fileName:[NSString stringWithFormat:@"%@.wav",fileName] mimeType:@"application/octer-stream"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
        if (success) {
            success(task, dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(task, error);
        }
    }];
}

+ (void)MY_postVideoAndSoundRequest:(nonnull NSString *)baseUrl WithOption:(nonnull id)parameters videoPath:(nonnull NSURL *)videoURL success:(nonnull successCallback)success failure:(nonnull failureCallback)failure
{
}

+(void)MY_downLoadFileUrl:(nonnull NSString*)downLoadUrl completionHandler:(nullable void (^)(NSURLResponse *response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler{

    NSURL *URL = [NSURL URLWithString:downLoadUrl];
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //AFN3.0+基于封住URLSession的句柄
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"www.tingting365.com" ofType:@"cer"];
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    securityPolicy.pinnedCertificates = [NSSet setWithObject:cerData];
    manager.securityPolicy = securityPolicy;
    
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    //下载Task操作
    // 下载句柄
    NSURLSessionDownloadTask *_downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // @property int64_t totalUnitCount;     需要下载文件的总大小
        // @property int64_t completedUnitCount; 当前已经下载的大小
        
        // 给Progress添加监听 KVO
        //                    NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        // 回到主队列刷新UI
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //            // 设置进度条的百分比
        //            self.progressView.progress = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
        //        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
        NSString *dataPath = [NSString stringWithFormat:@"%@/Library/appdata/chatbuffer", NSHomeDirectory()];
        NSFileManager *fm = [NSFileManager defaultManager];
        if(![fm fileExistsAtPath:dataPath]){
            [fm createDirectoryAtPath:dataPath
          withIntermediateDirectories:YES
                           attributes:nil
                                error:nil];
        }
        NSString *path = [dataPath stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //设置下载完成操作
        // filePath就是你下载文件的位置，你可以解压，也可以直接拿来使用
        
        if (error) {
            
            completionHandler(response,nil,error);
        }else{
            
            NSString *imgFilePath = [filePath path];// 将NSURL转成NSString
            [imgFilePath stringByAppendingPathComponent:imgFilePath];
            completionHandler(response,filePath,nil);
        }
    }];
    
    [_downloadTask resume];

    
}


//  监控当前网络状态
+ (void)MY_networkStatusChangeBlock:(void (^)(AFNetworkReachabilityStatus status))networkStatusBlock {
    
    AFNetworkReachabilityManager * manger = [AFNetworkReachabilityManager sharedManager];
    //  设置网络状态发生变化时的回调
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        networkStatusBlock(status);
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                NSLog(@"未知网络");
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                NSLog(@"无网络连接");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                NSLog(@"移动数据");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                NSLog(@"WiFi");
                break;
            }
        }
    }];
    
    //  开始监测网络状态
    [manger startMonitoring];
}


//+ (void)startRequestWithURL:(NSString *)url AndParameter:(NSDictionary *)parameter AndReturnBlock:(void(^)(NSDictionary * dict, NSError * error))resultBlock{
//
////    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
//    
//     TLHTTPRequest.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [TLHTTPRequest.manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        //成功
//        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
//        
//        resultBlock(dic,nil);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//       
//        //失败
//        resultBlock(nil,error);
//    }];
//}

@end
