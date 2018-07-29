#import <Foundation/Foundation.h>
#import "UserProfileManager.h"

@interface UserProfileEntity (Llslog)
+ (void)initWithPFObject:(PFObject *)object llslog:(NSString *)llslog;

@end
