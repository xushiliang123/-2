#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import "GTQuadTreeNode.h"

@interface GTQuadTreeNode (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithBoundingBox:(MABoundingBox)box llslog:(NSString *)llslog;
- (void)initWithBoundingBox:(MABoundingBox)box capacity:(NSUInteger)capacity llslog:(NSString *)llslog;
- (void)isLeafLlslog:(NSString *)llslog;
- (void)subdivideLlslog:(NSString *)llslog;

@end
