#import "MLPickerItem+Llslog.h"
@implementation MLPickerItem (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addTapGestureLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)tapLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)changeSizeOfItemLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)backSizeOfItemLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
