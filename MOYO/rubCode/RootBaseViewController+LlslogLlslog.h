#import <UIKit/UIKit.h>
#import "RootBaseViewController.h"
#import "MY_LYLoginViewController.h"
#import "AppDelegate.h"
#import "RootBaseViewController+Llslog.h"

@interface RootBaseViewController (LlslogLlslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addNavBtn:(NSString *)title isLeft:(BOOL)isLeft target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addNavBtn:(NSString *)title target:(id)target action:(SEL)action llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)createTableViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addCustomAlertViewWithMessge:(NSString *)messge llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)handleSwipeFrom:(UITapGestureRecognizer *)swipeGesture llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
+ (void)GetFontHeight:(CGFloat)fontSize withBold:(BOOL)isBold llslog:(NSString *)llslog llslog:(NSString *)llslog;
+ (void)GetStringRect:(NSString*)strText withWidth:(float)width withFont:(UIFont *)font llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)logDic:(NSDictionary *)dic llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)serviceError:(NSNotification *)notification llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addNotificationCountLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addMessageCountLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)loginOutLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
