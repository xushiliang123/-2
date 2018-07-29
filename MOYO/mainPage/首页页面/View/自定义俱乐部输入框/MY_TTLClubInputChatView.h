//
//  MY_TTLClubInputChatView.h
//  VTIME
//
//  Created by 听听 on 2017/10/17.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EaseChatToolbar.h"
#import "EaseFaceView.h"
#import "EaseTextView.h"
#import "EaseRecordView.h"
#import "EaseChatBarMoreView.h"
#import "EaseChatToolbarItem.h"
typedef void(^CramePhotoBlock)(EaseChatBarMoreView* moreView);
//@protocol EMChatToolbarDelegate;
@interface MY_TTLClubInputChatView : EaseChatToolbar
//@property (weak, nonatomic) id<EMChatToolbarDelegate> delegate;
@property(nonatomic, copy)CramePhotoBlock takePhoto;
- (instancetype)initWithFrame:(CGRect)frame type:(EMChatToolbarType)type;

@end
