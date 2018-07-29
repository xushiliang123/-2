#import "WXApiManager+Llslog.h"
@implementation WXApiManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)onResp:(BaseResp *)resp llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)onReq:(BaseReq *)req llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
