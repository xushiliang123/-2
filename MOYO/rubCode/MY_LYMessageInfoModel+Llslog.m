#import "MY_LYMessageInfoModel+Llslog.h"
@implementation MY_LYMessageInfoModel (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addDictionaryWithValue:(id)value key:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)msgDictLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setPersonModelArray:(NSArray *)modelArray llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)modelArrayLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadPersonModelWithID:(NSInteger)userId llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertModelWith:(MY_LYPersonInfoModel*)pinfmodel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
