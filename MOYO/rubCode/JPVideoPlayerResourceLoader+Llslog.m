#import "JPVideoPlayerResourceLoader+Llslog.h"
@implementation JPVideoPlayerResourceLoader (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceivedDataCacheInDiskByTempPath:(NSString * _Nonnull)tempCacheVideoPath videoFileExceptSize:(NSUInteger)expectedSize videoFileReceivedSize:(NSUInteger)receivedSize llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didCachedVideoDataFinishedFromWebFullVideoCachePath:(NSString * _Nullable)fullVideoCachePath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resourceLoader:(AVAssetResourceLoader *)resourceLoader shouldWaitForLoadingOfRequestedResource:(AVAssetResourceLoadingRequest *)loadingRequest llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resourceLoader:(AVAssetResourceLoader *)resourceLoader didCancelLoadingRequest:(AVAssetResourceLoadingRequest *)loadingRequest llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)internalPendingRequestsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)respondWithDataForRequest:(AVAssetResourceLoadingRequest *)loadingRequest andTempVideoData:(NSData * _Nullable)tempVideoData llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)fillInContentInformation:(AVAssetResourceLoadingContentInformationRequest * _Nonnull)contentInformationRequest llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
