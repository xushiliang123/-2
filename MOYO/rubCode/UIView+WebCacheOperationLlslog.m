#import "UIView+WebCacheOperationLlslog.h"
@implementation UIView (WebCacheOperationLlslog)
- (void)operationDictionaryLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_setImageLoadOperation:(id)operation forKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_cancelImageLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_removeImageLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
