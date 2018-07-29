#import <Foundation/Foundation.h>
#import "YYWeakProxy.h"

@interface YYWeakProxy (Llslog)
- (void)initWithTarget:(id)target llslog:(NSString *)llslog;
+ (void)proxyWithTarget:(id)target llslog:(NSString *)llslog;
- (void)forwardingTargetForSelector:(SEL)selector llslog:(NSString *)llslog;
- (void)forwardInvocation:(NSInvocation *)invocation llslog:(NSString *)llslog;
- (void)methodSignatureForSelector:(SEL)selector llslog:(NSString *)llslog;
- (void)respondsToSelector:(SEL)aSelector llslog:(NSString *)llslog;
- (void)isEqual:(id)object llslog:(NSString *)llslog;
- (void)hashLlslog:(NSString *)llslog;
- (void)superclassLlslog:(NSString *)llslog;
- (void)classLlslog:(NSString *)llslog;
- (void)isKindOfClass:(Class)aClass llslog:(NSString *)llslog;
- (void)isMemberOfClass:(Class)aClass llslog:(NSString *)llslog;
- (void)conformsToProtocol:(Protocol *)aProtocol llslog:(NSString *)llslog;
- (void)isProxyLlslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;
- (void)debugDescriptionLlslog:(NSString *)llslog;

@end
