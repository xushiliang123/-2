#import "GTQuadTree+Llslog.h"
@implementation GTQuadTree (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertAnnotation:(id<MAAnnotation>)annotation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertAnnotation:(id<MAAnnotation>)annotation toNode:(GTQuadTreeNode *)node llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)enumerateAnnotationsInBox:(MABoundingBox)box usingBlock:(void (^)(id<MAAnnotation>))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)enumerateAnnotationsUsingBlock:(void (^)(id<MAAnnotation>))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)enumerateAnnotationsInBox:(MABoundingBox)box withNode:(GTQuadTreeNode*)node usingBlock:(void (^)(id<MAAnnotation>))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
