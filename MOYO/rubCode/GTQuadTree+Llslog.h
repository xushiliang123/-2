#import <Foundation/Foundation.h>
#import "GTQuadTreeNode.h"
#import "GTQuadTree.h"

@interface GTQuadTree (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)insertAnnotation:(id<MAAnnotation>)annotation llslog:(NSString *)llslog;
- (void)insertAnnotation:(id<MAAnnotation>)annotation toNode:(GTQuadTreeNode *)node llslog:(NSString *)llslog;
- (void)enumerateAnnotationsInBox:(MABoundingBox)box usingBlock:(void (^)(id<MAAnnotation>))block llslog:(NSString *)llslog;
- (void)enumerateAnnotationsUsingBlock:(void (^)(id<MAAnnotation>))block llslog:(NSString *)llslog;
- (void)enumerateAnnotationsInBox:(MABoundingBox)box withNode:(GTQuadTreeNode*)node usingBlock:(void (^)(id<MAAnnotation>))block llslog:(NSString *)llslog;

@end
