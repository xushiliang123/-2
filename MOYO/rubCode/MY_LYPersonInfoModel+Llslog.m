#import "MY_LYPersonInfoModel+Llslog.h"
@implementation MY_LYPersonInfoModel (Llslog)
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)getTableNameLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)getPrimaryKeyLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
