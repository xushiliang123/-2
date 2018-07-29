#import <Foundation/Foundation.h>
#import "NSData+ImageContentType.h"

@interface NSData (ImageContentTypeLlslog)
+ (void)sd_contentTypeForImageData:(NSData *)data llslog:(NSString *)llslog;

@end
