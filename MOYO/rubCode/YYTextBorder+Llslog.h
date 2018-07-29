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

@interface YYTextBorder (Llslog)
+ (void)borderWithLineStyle:(YYTextLineStyle)lineStyle lineWidth:(CGFloat)width strokeColor:(UIColor *)color llslog:(NSString *)llslog;
+ (void)borderWithFillColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
