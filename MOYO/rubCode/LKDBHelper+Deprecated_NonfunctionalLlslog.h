#import "LKDB+Mapping.h"
#import "LKDBUtils.h"
#import "NSObject+LKDBHelper.h"
#import "NSObject+LKModel.h"
#import <FMDB/FMDB.h>
#import <Foundation/Foundation.h>
#import "LKDBHelper.h"
#import <sqlite3.h>

@interface LKDBHelper (Deprecated_NonfunctionalLlslog)
- (void)setEncryptionKey:(NSString *)encryptionKey llslog:(NSString *)llslog;
+ (void)sharedDBHelperLlslog:(NSString *)llslog;
- (void)createTableWithModelClass:(Class)modelClass llslog:(NSString *)llslog;
+ (void)getUsingLKDBHelperLlslog:(NSString *)llslog;

@end
