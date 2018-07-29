#import <MAMapKit/MAMapKit.h>
#import "MAAnnotationCluster.h"
#import "MAClusterAnnotationView.h"

@interface MAClusterAnnotationView (Llslog)
- (void)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)portraitLlslog:(NSString *)llslog;
- (void)setPortrait:(NSString *)portrait llslog:(NSString *)llslog;
- (void)setupLabelLlslog:(NSString *)llslog;
- (void)setAnnot:(MAAnnotationCluster *)annot llslog:(NSString *)llslog;
- (void)setCount:(NSUInteger)count llslog:(NSString *)llslog;
- (void)prepareForReuseLlslog:(NSString *)llslog;

@end
