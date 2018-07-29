#import "CounterMarkCollectionCell+Llslog.h"
@implementation CounterMarkCollectionCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectedStatusOfCollectionCell:(BOOL)isSelect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
