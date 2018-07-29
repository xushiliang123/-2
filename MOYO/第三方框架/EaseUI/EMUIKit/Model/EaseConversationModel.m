/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "EaseConversationModel.h"

#if ENABLE_LITE == 1
#import <HyphenateLite/EMConversation.h>
#else
#import <Hyphenate/EMConversation.h>
#endif

@implementation EaseConversationModel

- (instancetype)initWithConversation:(EMConversation *)conversation
{
    self = [super init];
    if (self) {
        _conversation = conversation;
//        _title = _conversation.conversationId;
        NSDictionary * dict = conversation.ext;
        _title = conversation.ext[@"nickname"];
        _avatarURLPath = conversation.ext[@"avatarURLPath"];
        if ([conversation.conversationId isEqualToString:@"tingting1"] || [conversation.conversationId isEqualToString:@"tingting3"] || [conversation.conversationId isEqualToString:@"kefu1"] || [conversation.conversationId isEqualToString:@"tingting5"])
        {
            
        }
        else
        {
            if (conversation.type == EMConversationTypeGroupChat || conversation.type == EMConversationTypeChatRoom)
            {
                _avatarImage = [UIImage imageNamed:@"EaseUIResource.bundle/group"];
            }
            else{
                _avatarImage = [UIImage imageNamed:@"占位图"];
                self.nobel = [conversation.ext[@"noble"] integerValue];
                self.addv = [conversation.ext[@"addVV"] integerValue];
                
                
                
            }
        }
        
        
        
        
    }
    
    return self;
}

@end
