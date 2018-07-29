#import <UIKit/UIKit.h>
#import "NSParagraphStyle+YYText.h"
#import "YYKitMacro.h"
#import "YYTextAttribute.h"
#import <CoreText/CoreText.h>

@interface NSParagraphStyle (YYTextLlslog)
+ (void)styleWithCTStyle:(CTParagraphStyleRef)CTStyle llslog:(NSString *)llslog;
- (void)CTStyleCF_RETURNS_RETAINEDLlslog:(NSString *)llslog;

@end
