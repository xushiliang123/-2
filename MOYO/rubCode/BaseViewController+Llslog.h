#import "RootBaseViewController.h"
#import "BaseViewController.h"

@interface BaseViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createTableViewLlslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)registerKeyboardNotificationLlslog:(NSString *)llslog;
- (void)removeKeyboardNotificationLlslog:(NSString *)llslog;
- (void)keyboardWillShow:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)keyboardWillHide:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)changeFrame:(float)y llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
