//
//  EMCallViewController.h
//  ChatDemo-UI3.0
//
//  Created by XieYajie on 22/11/2016.
//  Copyright © 2016 XieYajie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DemoCallManager.h"
//
//@protocol EMCallEndDelegate <NSObject>
//
//- (void)callEndSenderMessageWithDictionary:(NSDictionary *)dict;
//
//@end



@interface EMCallViewController : UIViewController

#if DEMO_CALL == 1

@property (strong, nonatomic, readonly) EMCallSession *callSession;

@property (nonatomic) BOOL isDismissing;

//@property (nonatomic, weak) id<EMCallEndDelegate> delegate;

- (instancetype)initWithCallSession:(EMCallSession *)aCallSession;

- (void)stateToConnected;

- (void)stateToAnswered;

- (void)clearData;

#endif

@end




