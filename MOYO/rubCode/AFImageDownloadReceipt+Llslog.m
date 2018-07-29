#import "AFImageDownloadReceipt+Llslog.h"
@implementation AFImageDownloadReceipt (Llslog)
- (void)initWithReceiptID:(NSUUID *)receiptID task:(NSURLSessionDataTask *)task llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
