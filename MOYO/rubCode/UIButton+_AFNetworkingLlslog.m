#import "UIButton+_AFNetworkingLlslog.h"
@implementation UIButton (_AFNetworkingLlslog)
- (void)af_imageDownloadReceiptForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_setImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt
                           forState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_backgroundImageDownloadReceiptForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_setBackgroundImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt
                                     forState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
