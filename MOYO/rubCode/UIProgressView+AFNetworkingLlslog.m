#import "UIProgressView+AFNetworkingLlslog.h"
@implementation UIProgressView (AFNetworkingLlslog)
- (void)af_uploadProgressAnimatedLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_setUploadProgressAnimated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_downloadProgressAnimatedLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_setDownloadProgressAnimated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setProgressWithUploadProgressOfTask:(NSURLSessionUploadTask *)task
                                   animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setProgressWithDownloadProgressOfTask:(NSURLSessionDownloadTask *)task
                                     animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(__unused NSDictionary *)change
                       context:(void *)context llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
