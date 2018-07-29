#import "UIView+WebVideoCacheOperationLlslog.h"
@implementation UIView (WebVideoCacheOperationLlslog)
- (void)setCurrentPlayingURL:(NSURL *)currentPlayingURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)currentPlayingURLLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)jp_setVideoLoadOperation:(id)operation forKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)jp_cancelVideoLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)jp_removeVideoLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)operationDictionaryLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
