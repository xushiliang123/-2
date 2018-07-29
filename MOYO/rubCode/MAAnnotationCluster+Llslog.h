#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import "MAAnnotationCluster.h"

@interface MAAnnotationCluster (Llslog)
- (void)debugDescriptionLlslog:(NSString *)llslog;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog;

@end
