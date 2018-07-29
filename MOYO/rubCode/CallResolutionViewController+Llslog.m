#import "CallResolutionViewController+Llslog.h"
@implementation CallResolutionViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
