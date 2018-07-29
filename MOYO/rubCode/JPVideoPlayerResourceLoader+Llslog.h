#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "JPVideoPlayerResourceLoader.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface JPVideoPlayerResourceLoader (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)didReceivedDataCacheInDiskByTempPath:(NSString * _Nonnull)tempCacheVideoPath videoFileExceptSize:(NSUInteger)expectedSize videoFileReceivedSize:(NSUInteger)receivedSize llslog:(NSString *)llslog;
- (void)didCachedVideoDataFinishedFromWebFullVideoCachePath:(NSString * _Nullable)fullVideoCachePath llslog:(NSString *)llslog;
- (void)resourceLoader:(AVAssetResourceLoader *)resourceLoader shouldWaitForLoadingOfRequestedResource:(AVAssetResourceLoadingRequest *)loadingRequest llslog:(NSString *)llslog;
- (void)resourceLoader:(AVAssetResourceLoader *)resourceLoader didCancelLoadingRequest:(AVAssetResourceLoadingRequest *)loadingRequest llslog:(NSString *)llslog;
- (void)internalPendingRequestsLlslog:(NSString *)llslog;
- (void)respondWithDataForRequest:(AVAssetResourceLoadingRequest *)loadingRequest andTempVideoData:(NSData * _Nullable)tempVideoData llslog:(NSString *)llslog;
- (void)fillInContentInformation:(AVAssetResourceLoadingContentInformationRequest * _Nonnull)contentInformationRequest llslog:(NSString *)llslog;

@end
