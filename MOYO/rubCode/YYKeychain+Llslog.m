#import "YYKeychain+Llslog.h"
@implementation YYKeychain (Llslog)
+ (void)getPasswordForService:(NSString *)serviceName
                            account:(NSString *)account
                              error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)getPasswordForService:(NSString *)serviceName
                                     account:(NSString *)account llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)deletePasswordForService:(NSString *)serviceName
                         account:(NSString *)account
                           error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)deletePasswordForService:(NSString *)serviceName account:(NSString *)account llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setPassword:(NSString *)password
         forService:(NSString *)serviceName
            account:(NSString *)account
              error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setPassword:(NSString *)password
         forService:(NSString *)serviceName
            account:(NSString *)account llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertItem:(YYKeychainItem *)item llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)updateItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)updateItem:(YYKeychainItem *)item llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)deleteItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)deleteItem:(YYKeychainItem *)item llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)selectOneItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)selectOneItem:(YYKeychainItem *)item llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)selectItems:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)selectItems:(YYKeychainItem *)item llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)errorWithCode:(OSStatus)osCode llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
