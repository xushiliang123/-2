#import <UIKit/UIKit.h>
#import "UIApplication+YYAdd.h"
#import "NSArray+YYAdd.h"
#import "NSObject+YYAdd.h"
#import "YYKitMacro.h"
#import "UIDevice+YYAdd.h"
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <objc/runtime.h>

@interface UIApplication (YYAddLlslog)
- (void)documentsURLLlslog:(NSString *)llslog;
- (void)documentsPathLlslog:(NSString *)llslog;
- (void)cachesURLLlslog:(NSString *)llslog;
- (void)cachesPathLlslog:(NSString *)llslog;
- (void)libraryURLLlslog:(NSString *)llslog;
- (void)libraryPathLlslog:(NSString *)llslog;
- (void)isPiratedLlslog:(NSString *)llslog;
- (void)_yy_fileExistInMainBundle:(NSString *)name llslog:(NSString *)llslog;
- (void)appBundleNameLlslog:(NSString *)llslog;
- (void)appBundleIDLlslog:(NSString *)llslog;
- (void)appVersionLlslog:(NSString *)llslog;
- (void)appBuildVersionLlslog:(NSString *)llslog;
- (void)isBeingDebuggedLlslog:(NSString *)llslog;
- (void)memoryUsageLlslog:(NSString *)llslog;
- (void)cpuUsageLlslog:(NSString *)llslog;
- (void)_delaySetActivity:(NSTimer *)timer llslog:(NSString *)llslog;
- (void)_changeNetworkActivityCount:(NSInteger)delta llslog:(NSString *)llslog;
- (void)incrementNetworkActivityCountLlslog:(NSString *)llslog;
- (void)decrementNetworkActivityCountLlslog:(NSString *)llslog;
+ (void)isAppExtensionLlslog:(NSString *)llslog;
+ (void)sharedExtensionApplicationLlslog:(NSString *)llslog;

@end
