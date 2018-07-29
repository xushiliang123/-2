#import "NSBundle+TZImagePickerLlslog.h"
@implementation NSBundle (TZImagePickerLlslog)
+ (void)tz_imagePickerBundleLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)tz_localizedStringForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)tz_localizedStringForKey:(NSString *)key value:(NSString *)value llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
