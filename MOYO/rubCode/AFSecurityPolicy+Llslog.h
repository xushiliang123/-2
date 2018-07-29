#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import "AFSecurityPolicy.h"
#import <AssertMacros.h>

@interface AFSecurityPolicy (Llslog)
+ (void)certificatesInBundle:(NSBundle *)bundle llslog:(NSString *)llslog;
+ (void)defaultPinnedCertificatesLlslog:(NSString *)llslog;
+ (void)defaultPolicyLlslog:(NSString *)llslog;
+ (void)policyWithPinningMode:(AFSSLPinningMode)pinningMode llslog:(NSString *)llslog;
+ (void)policyWithPinningMode:(AFSSLPinningMode)pinningMode withPinnedCertificates:(NSSet *)pinnedCertificates llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)setPinnedCertificates:(NSSet *)pinnedCertificates llslog:(NSString *)llslog;
- (void)evaluateServerTrust:(SecTrustRef)serverTrust
                  forDomain:(NSString *)domain llslog:(NSString *)llslog;
+ (void)keyPathsForValuesAffectingPinnedPublicKeysLlslog:(NSString *)llslog;
+ (void)supportsSecureCodingLlslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)decoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)coder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
