#import "SDWebImageManager+DeprecatedLlslog.h"
@implementation SDWebImageManager (DeprecatedLlslog)
- (void)downloadWithURL:(NSURL *)url options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedWithFinishedBlock)completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
