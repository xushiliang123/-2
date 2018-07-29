#import "MY_LLDBManager+Llslog.h"
@implementation MY_LLDBManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertWithModel:(BaseModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateModel:(BaseModel *)model withWhere:(NSString *)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectClass:(Class)cls withWhere:(NSString *)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectClass:(Class)cls withWhere:(NSString *)where orderBy:(NSString*)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectClass:(Class)cls withWhere:(NSString *)where responseBlock:(successBolck)block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteDataClass:(Class)cls WithWhere:(NSString *)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteTableWithClass:(Class)cls llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)filePathLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dbHelperLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
