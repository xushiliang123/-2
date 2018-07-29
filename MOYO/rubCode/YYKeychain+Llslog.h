#import <Foundation/Foundation.h>
#import "YYKeychain.h"
#import "UIDevice+YYAdd.h"
#import "YYKitMacro.h"
#import <Security/Security.h>

@interface YYKeychain (Llslog)
+ (void)getPasswordForService:(NSString *)serviceName
                            account:(NSString *)account
                              error:(NSError **)error llslog:(NSString *)llslog;
+ (void)getPasswordForService:(NSString *)serviceName
                                     account:(NSString *)account llslog:(NSString *)llslog;
+ (void)deletePasswordForService:(NSString *)serviceName
                         account:(NSString *)account
                           error:(NSError **)error llslog:(NSString *)llslog;
+ (void)deletePasswordForService:(NSString *)serviceName account:(NSString *)account llslog:(NSString *)llslog;
+ (void)setPassword:(NSString *)password
         forService:(NSString *)serviceName
            account:(NSString *)account
              error:(NSError **)error llslog:(NSString *)llslog;
+ (void)setPassword:(NSString *)password
         forService:(NSString *)serviceName
            account:(NSString *)account llslog:(NSString *)llslog;
+ (void)insertItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog;
+ (void)insertItem:(YYKeychainItem *)item llslog:(NSString *)llslog;
+ (void)updateItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog;
+ (void)updateItem:(YYKeychainItem *)item llslog:(NSString *)llslog;
+ (void)deleteItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog;
+ (void)deleteItem:(YYKeychainItem *)item llslog:(NSString *)llslog;
+ (void)selectOneItem:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog;
+ (void)selectOneItem:(YYKeychainItem *)item llslog:(NSString *)llslog;
+ (void)selectItems:(YYKeychainItem *)item error:(NSError **)error llslog:(NSString *)llslog;
+ (void)selectItems:(YYKeychainItem *)item llslog:(NSString *)llslog;
+ (void)errorWithCode:(OSStatus)osCode llslog:(NSString *)llslog;

@end
