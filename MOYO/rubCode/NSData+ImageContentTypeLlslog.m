#import "NSData+ImageContentTypeLlslog.h"
@implementation NSData (ImageContentTypeLlslog)
+ (void)sd_contentTypeForImageData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
