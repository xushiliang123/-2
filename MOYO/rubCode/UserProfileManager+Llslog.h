#import <Foundation/Foundation.h>
#import "UserProfileManager.h"

@interface UserProfileManager (Llslog)
+ (void)sharedInstanceLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initParseLlslog:(NSString *)llslog;
- (void)clearParseLlslog:(NSString *)llslog;
- (void)initDataLlslog:(NSString *)llslog;
- (void)uploadUserHeadImageProfileInBackground:(UIImage*)image
                           completion:(void (^)(BOOL success, NSError *error))completion llslog:(NSString *)llslog;
- (void)updateUserProfileInBackground:(NSDictionary*)param
                           completion:(void (^)(BOOL success, NSError *error))completion llslog:(NSString *)llslog;
- (void)loadUserProfileInBackgroundWithBuddy:(NSArray*)buddyList
                                saveToLoacal:(BOOL)save
                                  completion:(void (^)(BOOL success, NSError *error))completion llslog:(NSString *)llslog;
- (void)loadUserProfileInBackground:(NSArray*)usernames
                       saveToLoacal:(BOOL)save
                         completion:(void (^)(BOOL success, NSError *error))completion llslog:(NSString *)llslog;
- (void)getUserProfileByUsername:(NSString*)username llslog:(NSString *)llslog;
- (void)getCurUserProfileLlslog:(NSString *)llslog;
- (void)getNickNameWithUsername:(NSString*)username llslog:(NSString *)llslog;
- (void)savePFUserInDisk:(PFObject*)object llslog:(NSString *)llslog;
- (void)savePFUserInMemory:(PFObject*)object llslog:(NSString *)llslog;
- (void)queryPFObjectWithCompletion:(void (^)(PFObject *object, NSError *error))completion llslog:(NSString *)llslog;

@end
