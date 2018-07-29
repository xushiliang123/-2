#import <UIKit/UIKit.h>
#import "UIView+WebVideoCacheOperation.h"
#import "objc/runtime.h"
#import "JPVideoPlayerOperation.h"

@interface UIView (WebVideoCacheOperationLlslog)
- (void)setCurrentPlayingURL:(NSURL *)currentPlayingURL llslog:(NSString *)llslog;
- (void)currentPlayingURLLlslog:(NSString *)llslog;
- (void)jp_setVideoLoadOperation:(id)operation forKey:(NSString *)key llslog:(NSString *)llslog;
- (void)jp_cancelVideoLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)jp_removeVideoLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)operationDictionaryLlslog:(NSString *)llslog;

@end
