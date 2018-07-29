#import <Foundation/Foundation.h>
#import "UIImage+MWPhotoBrowser.h"

@interface UIImage (MWPhotoBrowserLlslog)
+ (void)imageForResourcePath:(NSString *)path ofType:(NSString *)type inBundle:(NSBundle *)bundle llslog:(NSString *)llslog;
+ (void)clearImageWithSize:(CGSize)size llslog:(NSString *)llslog;

@end
