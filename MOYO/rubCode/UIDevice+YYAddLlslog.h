#import <UIKit/UIKit.h>
#import "UIDevice+YYAdd.h"
#import "YYKitMacro.h"
#import "NSString+YYAdd.h"

@interface UIDevice (YYAddLlslog)
+ (void)systemVersionLlslog:(NSString *)llslog;
- (void)isPadLlslog:(NSString *)llslog;
- (void)isSimulatorLlslog:(NSString *)llslog;
- (void)isJailbrokenLlslog:(NSString *)llslog;
- (void)canMakePhoneCallsLlslog:(NSString *)llslog;
- (void)ipAddressWithIfaName:(NSString *)name llslog:(NSString *)llslog;
- (void)ipAddressWIFILlslog:(NSString *)llslog;
- (void)ipAddressCellLlslog:(NSString *)llslog;
- (void)getNetworkTrafficBytes:(YYNetworkTrafficType)types llslog:(NSString *)llslog;
- (void)machineModelLlslog:(NSString *)llslog;
- (void)machineModelNameLlslog:(NSString *)llslog;
- (void)systemUptimeLlslog:(NSString *)llslog;
- (void)diskSpaceLlslog:(NSString *)llslog;
- (void)diskSpaceFreeLlslog:(NSString *)llslog;
- (void)diskSpaceUsedLlslog:(NSString *)llslog;
- (void)memoryTotalLlslog:(NSString *)llslog;
- (void)memoryUsedLlslog:(NSString *)llslog;
- (void)memoryFreeLlslog:(NSString *)llslog;
- (void)memoryActiveLlslog:(NSString *)llslog;
- (void)memoryInactiveLlslog:(NSString *)llslog;
- (void)memoryWiredLlslog:(NSString *)llslog;
- (void)memoryPurgableLlslog:(NSString *)llslog;
- (void)cpuCountLlslog:(NSString *)llslog;
- (void)cpuUsageLlslog:(NSString *)llslog;
- (void)cpuUsagePerProcessorLlslog:(NSString *)llslog;


@end
