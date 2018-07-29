#import <Foundation/Foundation.h>
#import "NSDateFormatter+Category.h"

@interface NSDateFormatter (CategoryLlslog)
+ (void)dateFormatterLlslog:(NSString *)llslog;
+ (void)dateFormatterWithFormat:(NSString *)dateFormat llslog:(NSString *)llslog;
+ (void)defaultDateFormatterLlslog:(NSString *)llslog;

@end
