#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <YYKit/YYTextDebugOption.h>
#import <YYKit/YYTextLine.h>
#import <YYKit/YYTextInput.h>
#import "YYTextDebugOption.h"
#import "YYTextLine.h"
#import "YYTextInput.h"
#import "YYTextLayout.h"
#import "YYKitMacro.h"
#import "YYCGUtilities.h"
#import "YYTextUtilities.h"
#import "YYTextAttribute.h"
#import "YYTextArchiver.h"
#import "NSAttributedString+YYText.h"
#import "UIFont+YYAdd.h"

@interface YYTextContainer (Llslog)
+ (void)containerWithSize:(CGSize)size llslog:(NSString *)llslog;
+ (void)containerWithSize:(CGSize)size insets:(UIEdgeInsets)insets llslog:(NSString *)llslog;
+ (void)containerWithPath:(UIBezierPath *)path llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)mutableCopyWithZone:(nullable NSZone *)zone llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)sizeLlslog:(NSString *)llslog;
- (void)setSize:(CGSize)size llslog:(NSString *)llslog;
- (void)insetsLlslog:(NSString *)llslog;
- (void)setInsets:(UIEdgeInsets)insets llslog:(NSString *)llslog;
- (void)pathLlslog:(NSString *)llslog;
- (void)setPath:(UIBezierPath *)path llslog:(NSString *)llslog;
- (void)exclusionPathsLlslog:(NSString *)llslog;
- (void)setExclusionPaths:(NSArray *)exclusionPaths llslog:(NSString *)llslog;
- (void)isPathFillEvenOddLlslog:(NSString *)llslog;
- (void)setPathFillEvenOdd:(BOOL)pathFillEvenOdd llslog:(NSString *)llslog;
- (void)pathLineWidthLlslog:(NSString *)llslog;
- (void)setPathLineWidth:(CGFloat)pathLineWidth llslog:(NSString *)llslog;
- (void)isVerticalFormLlslog:(NSString *)llslog;
- (void)setVerticalForm:(BOOL)verticalForm llslog:(NSString *)llslog;
- (void)maximumNumberOfRowsLlslog:(NSString *)llslog;
- (void)setMaximumNumberOfRows:(NSUInteger)maximumNumberOfRows llslog:(NSString *)llslog;
- (void)truncationTypeLlslog:(NSString *)llslog;
- (void)setTruncationType:(YYTextTruncationType)truncationType llslog:(NSString *)llslog;
- (void)truncationTokenLlslog:(NSString *)llslog;
- (void)setTruncationToken:(NSAttributedString *)truncationToken llslog:(NSString *)llslog;
- (void)setLinePositionModifier:(id<YYTextLinePositionModifier>)linePositionModifier llslog:(NSString *)llslog;
- (void)linePositionModifierLlslog:(NSString *)llslog;

@end
