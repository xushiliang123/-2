#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <YYKit/YYTextAttribute.h>
#import "YYTextAttribute.h"
#import "YYTextLine.h"
#import "YYTextUtilities.h"
#import "YYKitMacro.h"

@interface YYTextLine (Llslog)
+ (void)lineWithCTLine:(CTLineRef)CTLine position:(CGPoint)position vertical:(BOOL)isVertical llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setCTLine:(_Nonnull CTLineRef)CTLine llslog:(NSString *)llslog;
- (void)setPosition:(CGPoint)position llslog:(NSString *)llslog;
- (void)reloadBoundsLlslog:(NSString *)llslog;
- (void)sizeLlslog:(NSString *)llslog;
- (void)widthLlslog:(NSString *)llslog;
- (void)heightLlslog:(NSString *)llslog;
- (void)topLlslog:(NSString *)llslog;
- (void)bottomLlslog:(NSString *)llslog;
- (void)leftLlslog:(NSString *)llslog;
- (void)rightLlslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;

@end
