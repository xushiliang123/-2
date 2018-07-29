#import <Foundation/Foundation.h>
#import "IConversationModel.h"
#import "EaseConversationModel.h"
#import <Hyphenate/EMConversation.h>

@interface EaseConversationModel (Llslog)
- (void)initWithConversation:(EMConversation *)conversation llslog:(NSString *)llslog;

@end
