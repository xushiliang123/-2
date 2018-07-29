#import "EaseConversationModel+Llslog.h"
@implementation EaseConversationModel (Llslog)
- (void)initWithConversation:(EMConversation *)conversation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
