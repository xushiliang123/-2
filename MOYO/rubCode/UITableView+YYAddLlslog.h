#import <UIKit/UIKit.h>
#import "UITableView+YYAdd.h"
#import "YYKitMacro.h"

@interface UITableView (YYAddLlslog)
- (void)updateWithBlock:(void (^)(UITableView *tableView))block llslog:(NSString *)llslog;
- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation llslog:(NSString *)llslog;
- (void)clearSelectedRowsAnimated:(BOOL)animated llslog:(NSString *)llslog;

@end
