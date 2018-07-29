#import "TZCollectionView+Llslog.h"
@implementation TZCollectionView (Llslog)
- (void)touchesShouldCancelInContentView:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
