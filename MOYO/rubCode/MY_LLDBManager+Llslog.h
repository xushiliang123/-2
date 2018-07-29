#import <Foundation/Foundation.h>
#import "MY_LLDBManager.h"
#import <LKDBHelper.h>

@interface MY_LLDBManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog;
- (void)insertWithModel:(BaseModel *)model llslog:(NSString *)llslog;
- (void)updateModel:(BaseModel *)model withWhere:(NSString *)where llslog:(NSString *)llslog;
- (void)selectClass:(Class)cls withWhere:(NSString *)where llslog:(NSString *)llslog;
- (void)selectClass:(Class)cls withWhere:(NSString *)where orderBy:(NSString*)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog;
- (void)selectClass:(Class)cls withWhere:(NSString *)where responseBlock:(successBolck)block llslog:(NSString *)llslog;
- (void)deleteDataClass:(Class)cls WithWhere:(NSString *)where llslog:(NSString *)llslog;
- (void)deleteTableWithClass:(Class)cls llslog:(NSString *)llslog;
- (void)filePathLlslog:(NSString *)llslog;
- (void)dbHelperLlslog:(NSString *)llslog;

@end
