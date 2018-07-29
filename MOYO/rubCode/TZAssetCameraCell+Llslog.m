#import "TZAssetCameraCell+Llslog.h"
@implementation TZAssetCameraCell (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)layoutSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
