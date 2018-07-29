#import "DemoCallManager+Llslog.h"
@implementation DemoCallManager (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sharedManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_initManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_clearCurrentCallViewAndDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_timeoutBeforeCallAnsweredLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_startCallTimerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_stopCallTimerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cmdMessagesDidReceive:(NSArray *)aCmdMessages llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)callDidReceive:(EMCallSession *)aSession llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)callDidConnect:(EMCallSession *)aSession llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)callDidAccept:(EMCallSession *)aSession llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)callDidEnd:(EMCallSession *)aSession
            reason:(EMCallEndReason)aReason
             error:(EMError *)aError llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveCallNetworkChanged:(EMCallSession *)aSession status:(EMCallNetworkStatus)aStatus llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)callRemoteOffline:(NSString *)aRemoteName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)makeCall:(NSNotification*)notify llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)saveCallOptionsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)makeCallWithUsername:(NSString *)aUsername
                        type:(EMCallType)aType ext:(NSDictionary*)extDic llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)answerCall:(NSString *)aCallId llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hangupCallWithReason:(EMCallEndReason)aReason llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertCallMessage:(NSNotification *)not llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
