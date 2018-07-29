#import "YYTextRunGlyphRange+Llslog.h"
@implementation YYTextRunGlyphRange (Llslog)
+ (void)rangeWithRange:(NSRange)range drawMode:(YYTextRunGlyphDrawMode)mode llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
