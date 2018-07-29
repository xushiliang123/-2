#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewAttribute.h"
#import "View+MASAdditions.h"
#import <objc/runtime.h>

@interface MAS_VIEW (MASAdditionsLlslog)
- (void)mas_makeConstraints:(void(^)(MASConstraintMaker *))block llslog:(NSString *)llslog;
- (void)mas_updateConstraints:(void(^)(MASConstraintMaker *))block llslog:(NSString *)llslog;
- (void)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block llslog:(NSString *)llslog;
- (void)mas_leftLlslog:(NSString *)llslog;
- (void)mas_topLlslog:(NSString *)llslog;
- (void)mas_rightLlslog:(NSString *)llslog;
- (void)mas_bottomLlslog:(NSString *)llslog;
- (void)mas_leadingLlslog:(NSString *)llslog;
- (void)mas_trailingLlslog:(NSString *)llslog;
- (void)mas_widthLlslog:(NSString *)llslog;
- (void)mas_heightLlslog:(NSString *)llslog;
- (void)mas_centerXLlslog:(NSString *)llslog;
- (void)mas_centerYLlslog:(NSString *)llslog;
- (void)mas_baselineLlslog:(NSString *)llslog;
- (void)mas_lastBaselineLlslog:(NSString *)llslog;
- (void)mas_leftMarginLlslog:(NSString *)llslog;
- (void)mas_rightMarginLlslog:(NSString *)llslog;
- (void)mas_topMarginLlslog:(NSString *)llslog;
- (void)mas_bottomMarginLlslog:(NSString *)llslog;
- (void)mas_leadingMarginLlslog:(NSString *)llslog;
- (void)mas_trailingMarginLlslog:(NSString *)llslog;
- (void)mas_centerXWithinMarginsLlslog:(NSString *)llslog;
- (void)mas_centerYWithinMarginsLlslog:(NSString *)llslog;
- (void)mas_keyLlslog:(NSString *)llslog;
- (void)setMas_key:(id)key llslog:(NSString *)llslog;
- (void)mas_closestCommonSuperview:(MAS_VIEW *)view llslog:(NSString *)llslog;

@end
