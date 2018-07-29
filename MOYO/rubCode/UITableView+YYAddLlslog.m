#import "UITableView+YYAddLlslog.h"
@implementation UITableView (YYAddLlslog)
- (void)updateWithBlock:(void (^)(UITableView *tableView))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)clearSelectedRowsAnimated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
