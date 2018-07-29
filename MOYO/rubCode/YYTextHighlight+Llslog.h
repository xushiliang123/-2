#import <UIKit/UIKit.h>
#import "YYTextAttribute.h"
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "NSObject+YYAdd.h"
#import "NSAttributedString+YYText.h"
#import "YYAnimatedImageView.h"
#import "YYTextArchiver.h"
#import "UIFont+YYAdd.h"
#import "UIDevice+YYAdd.h"

@interface YYTextHighlight (Llslog)
+ (void)highlightWithAttributes:(NSDictionary *)attributes llslog:(NSString *)llslog;
+ (void)highlightWithBackgroundColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)setAttributes:(NSDictionary *)attributes llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)_makeMutableAttributesLlslog:(NSString *)llslog;
- (void)setFont:(UIFont *)font llslog:(NSString *)llslog;
- (void)setColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)setStrokeWidth:(NSNumber *)width llslog:(NSString *)llslog;
- (void)setStrokeColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)setTextAttribute:(NSString *)attribute value:(id)value llslog:(NSString *)llslog;
- (void)setShadow:(YYTextShadow *)shadow llslog:(NSString *)llslog;
- (void)setInnerShadow:(YYTextShadow *)shadow llslog:(NSString *)llslog;
- (void)setUnderline:(YYTextDecoration *)underline llslog:(NSString *)llslog;
- (void)setStrikethrough:(YYTextDecoration *)strikethrough llslog:(NSString *)llslog;
- (void)setBackgroundBorder:(YYTextBorder *)border llslog:(NSString *)llslog;
- (void)setBorder:(YYTextBorder *)border llslog:(NSString *)llslog;
- (void)setAttachment:(YYTextAttachment *)attachment llslog:(NSString *)llslog;

@end
