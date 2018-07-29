#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import "AFURLRequestSerialization.h"
#import <MobileCoreServices/MobileCoreServices.h>
//#import <CoreServices/CoreServices.h>

@interface AFPropertyListRequestSerializer (Llslog)
+ (void)serializerLlslog:(NSString *)llslog;
+ (void)serializerWithFormat:(NSPropertyListFormat)format
                        writeOptions:(NSPropertyListWriteOptions)writeOptions llslog:(NSString *)llslog;
- (void)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError *__autoreleasing *)error llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)decoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)coder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
