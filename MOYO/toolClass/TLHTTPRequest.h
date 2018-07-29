//
//  TLHTTPRequest.h
//  TogetherLu
//
//  Created by Louie on 16/12/19.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

//成功
typedef void(^ successCallback)(NSURLSessionDataTask  * _Nonnull task,  NSDictionary  * _Nonnull  data);
//失败
typedef void(^failureCallback)(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error);

//typedef void (^networkStatusBlock)(AFNetworkReachabilityStatus status);

typedef NS_ENUM(NSUInteger, ResposeStyle) {
    JSON = 1,
    XML  = 2,
    Data = 3,
};

typedef NS_ENUM(NSUInteger, RequestStyle) {
    RequestJSON,
    RequestString,
    RequestDefault,
};

@interface TLHTTPRequest : NSObject



//取消所有的网络数据请求
+ (void)MY_cancelAllHttpRequestByApiPath:(nullable NSString *)path;


//+ (void)startRequestWithURL:(NSString *)url AndParameter:(NSDictionary *)parameter AndReturnBlock:(void(^)(NSDictionary * dict, NSError * error))resultBlock;


/**
 *  post请求
 *
 *  @param parameters 参数
 *  @param success    请求成功
 *  @param failure    请求失败
 */
+ (void)MY_postWithBaseUrl:(nonnull NSString *)baseUrl
             parameters:(nonnull id)parameters
                success:(nonnull successCallback)success
                failure:(nonnull failureCallback)failure;

/**
 *  get请求
 *
 *  @param parameters 参数
 *  @param success    请求成功
 *  @param failure    请求失败
 */
+ (void)MY_getWithBaseUrl:(nonnull NSString *)baseUrl
            parameters:(nullable id)parameters
               success:(nonnull successCallback)success
               failure:(nonnull failureCallback)failure;

//  上传图片
+ (void)MY_postDataAndImageRequest:(nonnull NSString *)baseUrl parameters:(nullable id)parameters imageDataArr:(nonnull NSArray *)imageDataArr success:(nonnull successCallback)success failure:(nonnull failureCallback)failure;
//  多图上传
+ (void)MY_postDataAndMoreImagesRequest:(nonnull NSString *)baseUrl parameters:(nullable id)parameters imageDataArr:(nonnull NSArray *)imageDataArr success:(nonnull successCallback)success failure:(nonnull failureCallback)failure;
//  只上传单个文件
+ (void)MY_postDataOrFillRequest:(nonnull NSString *)baseUrl parameters:(nullable id)parameters imageDataArr:(nonnull NSData *)imageData success:(nonnull successCallback)success failure:(nonnull failureCallback)failure;

+ (void)MY_postVideoAndSoundRequest:(nonnull NSString *)baseUrl WithOption:(nonnull id)parameters videoPath:(nonnull NSURL *)videoURL success:(nonnull successCallback)success failure:(nonnull failureCallback)failure;


+ (void)MY_postToUrlString:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters fileData:(nonnull NSData *)fileData name:(nonnull NSString *)name fileName:(nonnull NSString *)fileName mimeType:(NSInteger)mimeType response:(ResposeStyle)styleR success:(nonnull successCallback)success failure:(nonnull failureCallback)failure;

+(void)MY_downLoadFileUrl:(nonnull NSString*)downLoadUrl completionHandler:(nullable void (^)(NSURLResponse * response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler;


//  监控当前网络状态
+ (void)MY_networkStatusChangeBlock:(nullable void (^)(AFNetworkReachabilityStatus status))networkStatusBlock;

+(NSString*)MY_getWorldChannelID;


@end
