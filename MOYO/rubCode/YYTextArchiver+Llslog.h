#import <UIKit/UIKit.h>
#import "YYTextArchiver.h"
#import "YYTextRunDelegate.h"
#import "YYTextRubyAnnotation.h"
#import "UIDevice+YYAdd.h"

@interface YYTextArchiver (Llslog)
+ (void)archivedDataWithRootObject:(id)rootObject llslog:(NSString *)llslog;
+ (void)archiveRootObject:(id)rootObject toFile:(NSString *)path llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initForWritingWithMutableData:(NSMutableData *)data llslog:(NSString *)llslog;
- (void)archiver:(NSKeyedArchiver *)archiver willEncodeObject:(id)object llslog:(NSString *)llslog;

@end
