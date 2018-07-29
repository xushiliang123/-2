#import "MY_LYTaskListModel+Llslog.h"
@implementation MY_LYTaskListModel (Llslog)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
