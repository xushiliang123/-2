#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "YYTextRunDelegate.h"

@interface YYTextRunDelegate (Llslog)
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
