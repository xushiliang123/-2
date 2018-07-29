#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import "AFURLRequestSerialization.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface AFJSONRequestSerializer (Llslog)
+ (void)serializerLlslog:(NSString *)llslog;
+ (void)serializerWithWritingOptions:(NSJSONWritingOptions)writingOptions llslog:(NSString *)llslog;
- (void)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError *__autoreleasing *)error llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)decoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)coder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
