#import "UIImage+MWPhotoBrowserLlslog.h"
@implementation UIImage (MWPhotoBrowserLlslog)
+ (void)imageForResourcePath:(NSString *)path ofType:(NSString *)type inBundle:(NSBundle *)bundle llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)clearImageWithSize:(CGSize)size llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
