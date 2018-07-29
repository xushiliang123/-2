//
//  RealTimeCallModel.h
//  TogetherLu
//
//  Created by Louie on 2017/5/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "EaseUI.h"

@interface RealTimeCallModel : EaseMessageModel

//NSString * avatarURLPath = [[NSUserDefaults standardUserDefaults] objectForKey:@"headIcon"];
//NSMutableDictionary * ext = [NSMutableDictionary dictionaryWithObject:@"YES" forKey:@"realTimeCall"];

@property (nonatomic, strong) NSString * realTimeCall;
@property (nonatomic, strong) NSNumber * callType;

@end
