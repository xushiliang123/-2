#import <Foundation/Foundation.h>
#import "NSKeyedUnarchiver+YYAdd.h"
#import "YYKitMacro.h"

@interface NSKeyedUnarchiver (YYAddLlslog)
+ (void)unarchiveObjectWithData:(NSData *)data exception:(__autoreleasing NSException **)exception llslog:(NSString *)llslog;
+ (void)unarchiveObjectWithFile:(NSString *)path exception:(__autoreleasing NSException **)exception llslog:(NSString *)llslog;

@end
