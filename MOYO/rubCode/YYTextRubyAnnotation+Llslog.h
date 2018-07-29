#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "YYTextRubyAnnotation.h"

@interface YYTextRubyAnnotation (Llslog)
- (void)initLlslog:(NSString *)llslog;
+ (void)rubyWithCTRubyRef:(CTRubyAnnotationRef)ctRuby llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;

@end
