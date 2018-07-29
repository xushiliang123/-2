#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "TLHTTPRequest.h"
#import <AVFoundation/AVFoundation.h>

@interface TLHTTPRequest (Llslog)
+ (void)getUrlStringBaseUrl:(NSString*)baseUrl llslog:(NSString *)llslog;
+ (void)getWorldChannelIDLlslog:(NSString *)llslog;
+ (void)MY_cancelAllHttpRequestByApiPath:(nullable NSString *)path llslog:(NSString *)llslog;
+ (void)MY_postWithBaseUrl:(NSString *)baseUrl
             parameters:(id)parameters
                success:(successCallback)success
                failure:(failureCallback)failure llslog:(NSString *)llslog;
+ (void)MY_getWithBaseUrl:(NSString *)baseUrl
            parameters:(id)parameters
               success:(successCallback)success
               failure:(failureCallback)failure llslog:(NSString *)llslog;
+ (void)MY_postDataAndImageRequest:(NSString *)baseUrl parameters:(id)parameters imageDataArr:(NSArray *)imageDataArr success:(successCallback)success failure:(failureCallback)failure llslog:(NSString *)llslog;
+ (void)MY_postDataAndMoreImagesRequest:(NSString *)baseUrl parameters:(id)parameters imageDataArr:(NSArray *)imageDataArr success:(successCallback)success failure:(failureCallback)failure llslog:(NSString *)llslog;
+ (void)MY_postDataOrFillRequest:(NSString *)baseUrl parameters:(id)parameters imageDataArr:(NSData *)imageData success:(successCallback)success failure:(failureCallback)failure llslog:(NSString *)llslog;
+ (void)MY_postToUrlString:(nonnull NSString *)url parameters:(nonnull NSDictionary *)parameters fileData:(nonnull NSData *)fileData name:(nonnull NSString *)name fileName:(nonnull NSString *)fileName mimeType:(NSInteger)mimeType response:(ResposeStyle)styleR success:(nonnull successCallback)success failure:(nonnull failureCallback)failure llslog:(NSString *)llslog;
+ (void)MY_postVideoAndSoundRequest:(nonnull NSString *)baseUrl WithOption:(nonnull id)parameters videoPath:(nonnull NSURL *)videoURL success:(nonnull successCallback)success failure:(nonnull failureCallback)failure llslog:(NSString *)llslog;
+ (void)MY_downLoadFileUrl:(nonnull NSString*)downLoadUrl completionHandler:(nullable void (^)(NSURLResponse *response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler llslog:(NSString *)llslog;
+ (void)MY_networkStatusChangeBlock:(void (^)(AFNetworkReachabilityStatus status))networkStatusBlock llslog:(NSString *)llslog;

@end
