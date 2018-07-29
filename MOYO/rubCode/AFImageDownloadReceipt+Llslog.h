#import <TargetConditionals.h>
#import <Foundation/Foundation.h>
#import "AFAutoPurgingImageCache.h"
#import "AFHTTPSessionManager.h"
#import <TargetConditionals.h>
#import "AFImageDownloader.h"
#import "AFHTTPSessionManager.h"

@interface AFImageDownloadReceipt (Llslog)
- (void)initWithReceiptID:(NSUUID *)receiptID task:(NSURLSessionDataTask *)task llslog:(NSString *)llslog;

@end
