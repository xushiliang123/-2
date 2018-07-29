#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WXApiManager.h"

@interface WXApiManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)onResp:(BaseResp *)resp llslog:(NSString *)llslog;
- (void)onReq:(BaseReq *)req llslog:(NSString *)llslog;

@end
