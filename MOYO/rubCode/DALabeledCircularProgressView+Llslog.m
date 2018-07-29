#import "DALabeledCircularProgressView+Llslog.h"
@implementation DALabeledCircularProgressView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initializeLabelLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
