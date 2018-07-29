#import <Foundation/Foundation.h>
#import <Hyphenate/Hyphenate.h>
#import "EMCallOptions+NSCoding.h"
#import "DemoCallManager.h"
#import "EaseSDKHelper.h"
#import "TabBarController.h"
#import "EMCallViewController.h"
#import "MY_LYMessageInfoModel.h"

@interface DemoCallManager (Llslog)
- (void)initLlslog:(NSString *)llslog;
+ (void)sharedManagerLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)_initManagerLlslog:(NSString *)llslog;
- (void)_clearCurrentCallViewAndDataLlslog:(NSString *)llslog;
- (void)_timeoutBeforeCallAnsweredLlslog:(NSString *)llslog;
- (void)_startCallTimerLlslog:(NSString *)llslog;
- (void)_stopCallTimerLlslog:(NSString *)llslog;
- (void)cmdMessagesDidReceive:(NSArray *)aCmdMessages llslog:(NSString *)llslog;
- (void)callDidReceive:(EMCallSession *)aSession llslog:(NSString *)llslog;
- (void)callDidConnect:(EMCallSession *)aSession llslog:(NSString *)llslog;
- (void)callDidAccept:(EMCallSession *)aSession llslog:(NSString *)llslog;
- (void)callDidEnd:(EMCallSession *)aSession
            reason:(EMCallEndReason)aReason
             error:(EMError *)aError llslog:(NSString *)llslog;
- (void)didReceiveCallNetworkChanged:(EMCallSession *)aSession status:(EMCallNetworkStatus)aStatus llslog:(NSString *)llslog;
- (void)callRemoteOffline:(NSString *)aRemoteName llslog:(NSString *)llslog;
- (void)makeCall:(NSNotification*)notify llslog:(NSString *)llslog;
- (void)saveCallOptionsLlslog:(NSString *)llslog;
- (void)makeCallWithUsername:(NSString *)aUsername
                        type:(EMCallType)aType ext:(NSDictionary*)extDic llslog:(NSString *)llslog;
- (void)answerCall:(NSString *)aCallId llslog:(NSString *)llslog;
- (void)hangupCallWithReason:(EMCallEndReason)aReason llslog:(NSString *)llslog;
- (void)insertCallMessage:(NSNotification *)not llslog:(NSString *)llslog;

@end
