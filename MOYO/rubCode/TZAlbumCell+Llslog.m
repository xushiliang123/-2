#import "TZAlbumCell+Llslog.h"
@implementation TZAlbumCell (Llslog)
- (void)setModel:(TZAlbumModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)layoutSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)layoutSublayersOfLayer:(CALayer *)layer llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)posterImageViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)titleLableLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)arrowImageViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectedCountButtonLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
