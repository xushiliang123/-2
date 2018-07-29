#import "UIImageView+_AFNetworkingLlslog.h"
@implementation UIImageView (_AFNetworkingLlslog)
- (void)af_activeImageDownloadReceiptLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_setActiveImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
