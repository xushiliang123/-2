#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIButton+AFNetworking.h"
#import <objc/runtime.h>
#import "UIImageView+AFNetworking.h"
#import "AFImageDownloader.h"

@interface UIButton (_AFNetworkingLlslog)
- (void)af_imageDownloadReceiptForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)af_setImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt
                           forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)af_backgroundImageDownloadReceiptForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)af_setBackgroundImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt
                                     forState:(UIControlState)state llslog:(NSString *)llslog;

@end
