#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIProgressView+AFNetworking.h"
#import <objc/runtime.h>
#import "AFURLSessionManager.h"

@interface UIProgressView (AFNetworkingLlslog)
- (void)af_uploadProgressAnimatedLlslog:(NSString *)llslog;
- (void)af_setUploadProgressAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)af_downloadProgressAnimatedLlslog:(NSString *)llslog;
- (void)af_setDownloadProgressAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)setProgressWithUploadProgressOfTask:(NSURLSessionUploadTask *)task
                                   animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)setProgressWithDownloadProgressOfTask:(NSURLSessionDownloadTask *)task
                                     animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(__unused NSDictionary *)change
                       context:(void *)context llslog:(NSString *)llslog;

@end
