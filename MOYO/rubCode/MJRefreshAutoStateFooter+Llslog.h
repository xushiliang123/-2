#import "MJRefreshAutoFooter.h"
#import "MJRefreshAutoStateFooter.h"

@interface MJRefreshAutoStateFooter (Llslog)
- (void)stateTitlesLlslog:(NSString *)llslog;
- (void)stateLabelLlslog:(NSString *)llslog;
- (void)setTitle:(NSString *)title forState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)stateLabelClickLlslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;

@end
