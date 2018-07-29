#import <Foundation/Foundation.h>
#import "FMResultSet.h"
#import "FMDatabasePool.h"
#import "FMDatabase.h"
#import "unistd.h"
#import <objc/runtime.h>
#import <sqlite3.h>

@interface FMStatement (Llslog)
- (void)finalizeLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)closeLlslog:(NSString *)llslog;
- (void)resetLlslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;

@end
