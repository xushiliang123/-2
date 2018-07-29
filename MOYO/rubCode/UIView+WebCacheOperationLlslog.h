#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"
#import "UIView+WebCacheOperation.h"
#import "objc/runtime.h"

@interface UIView (WebCacheOperationLlslog)
- (void)operationDictionaryLlslog:(NSString *)llslog;
- (void)sd_setImageLoadOperation:(id)operation forKey:(NSString *)key llslog:(NSString *)llslog;
- (void)sd_cancelImageLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)sd_removeImageLoadOperationWithKey:(NSString *)key llslog:(NSString *)llslog;

@end
