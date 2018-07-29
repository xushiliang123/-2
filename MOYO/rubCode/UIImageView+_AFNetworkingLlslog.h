#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"
#import <objc/runtime.h>
#import "AFImageDownloader.h"

@interface UIImageView (_AFNetworkingLlslog)
- (void)af_activeImageDownloadReceiptLlslog:(NSString *)llslog;
- (void)af_setActiveImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt llslog:(NSString *)llslog;

@end
