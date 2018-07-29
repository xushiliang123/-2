#import "TZTestCell+Llslog.h"
@implementation TZTestCell (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)layoutSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAsset:(id)asset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setRow:(NSInteger)row llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)snapshotViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
