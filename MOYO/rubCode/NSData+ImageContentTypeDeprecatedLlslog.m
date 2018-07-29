#import "NSData+ImageContentTypeDeprecatedLlslog.h"
@implementation NSData (ImageContentTypeDeprecatedLlslog)
+ (void)contentTypeForImageData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
