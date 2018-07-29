#import <Foundation/Foundation.h>
#import "GTQuadTreeNode.h"
#import "MAAnnotationCluster.h"
#import "MAClusteringManager.h"
#import "GTQuadTree.h"

@interface MAClusteringManager (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithAnnotations:(NSArray *)annotations llslog:(NSString *)llslog;
- (void)setAnnotations:(NSArray *)annotations llslog:(NSString *)llslog;
- (void)addAnnotations:(NSArray *)annotations llslog:(NSString *)llslog;
- (void)clusteredAnnotationsWithinMapRect:(MAMapRect)rect withZoomScale:(double)zoomScale llslog:(NSString *)llslog;
- (void)allAnnotationsLlslog:(NSString *)llslog;
- (void)displayAnnotations:(NSArray *)annotations onMapView:(MAMapView *)mapView llslog:(NSString *)llslog;

@end
