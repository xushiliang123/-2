#import "MAClusterAnnotationView+Llslog.h"
@implementation MAClusterAnnotationView (Llslog)
- (void)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)portraitLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setPortrait:(NSString *)portrait llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setupLabelLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAnnot:(MAAnnotationCluster *)annot llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setCount:(NSUInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prepareForReuseLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
