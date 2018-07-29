#import "BaseViewController.h"
#import "MY_LLPayViewController.h"

@interface MY_LLPayViewController (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)hidesBottomBarWhenPushedLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewDidDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)downloadDataLlslog:(NSString *)llslog;
- (void)confirmBtnClick:(UIButton *)sender llslog:(NSString *)llslog;
- (void)sendLittleRedPacket:(NSDictionary*)parameters llslog:(NSString *)llslog;
- (void)sendRedPacketRenwu:(NSDictionary*)parameters llslog:(NSString *)llslog;
- (void)sendSayHelloHongBao:(NSDictionary*)parameters llslog:(NSString *)llslog;
- (void)sendRedPacketDynamic:(NSDictionary*)parameters llslog:(NSString *)llslog;
- (void)bpRequestLlslog:(NSString *)llslog;
- (void)WXPAYSuccess:(NSNotification *)not llslog:(NSString *)llslog;
- (void)WXPAYERROR:(NSNotification *)not llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)pushRenwuVCWithDictionaryLlslog:(NSString *)llslog;
- (void)selectWayOfweichat:(UITapGestureRecognizer*)gesture llslog:(NSString *)llslog;
- (void)selectWayOfAliPay:(UITapGestureRecognizer*)gesture llslog:(NSString *)llslog;
- (void)selectWayOfPay:(UITapGestureRecognizer*)gesture llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
