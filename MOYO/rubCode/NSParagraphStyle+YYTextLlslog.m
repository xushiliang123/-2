#import "NSParagraphStyle+YYTextLlslog.h"
@implementation NSParagraphStyle (YYTextLlslog)
+ (void)styleWithCTStyle:(CTParagraphStyleRef)CTStyle llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)CTStyleCF_RETURNS_RETAINEDLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
