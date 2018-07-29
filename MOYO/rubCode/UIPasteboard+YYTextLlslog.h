#import <UIKit/UIKit.h>
#import "UIPasteboard+YYText.h"
#import "YYKitMacro.h"
#import "YYImage.h"
#import "NSAttributedString+YYText.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface UIPasteboard (YYTextLlslog)
- (void)setPNGData:(NSData *)PNGData llslog:(NSString *)llslog;
- (void)PNGDataLlslog:(NSString *)llslog;
- (void)setJPEGData:(NSData *)JPEGData llslog:(NSString *)llslog;
- (void)JPEGDataLlslog:(NSString *)llslog;
- (void)setGIFData:(NSData *)GIFData llslog:(NSString *)llslog;
- (void)GIFDataLlslog:(NSString *)llslog;
- (void)setWEBPData:(NSData *)WEBPData llslog:(NSString *)llslog;
- (void)WEBPDataLlslog:(NSString *)llslog;
- (void)setImageData:(NSData *)imageData llslog:(NSString *)llslog;
- (void)imageDataLlslog:(NSString *)llslog;
- (void)setAttributedString:(NSAttributedString *)attributedString llslog:(NSString *)llslog;
- (void)attributedStringLlslog:(NSString *)llslog;

@end
