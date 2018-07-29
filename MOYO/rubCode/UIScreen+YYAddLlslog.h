#import <UIKit/UIKit.h>
#import "UIScreen+YYAdd.h"
#import "YYKitMacro.h"
#import "UIDevice+YYAdd.h"

@interface UIScreen (YYAddLlslog)
+ (void)screenScaleLlslog:(NSString *)llslog;
- (void)currentBoundsLlslog:(NSString *)llslog;
- (void)boundsForOrientation:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog;
- (void)sizeInPixelLlslog:(NSString *)llslog;
- (void)pixelsPerInchLlslog:(NSString *)llslog;

@end
