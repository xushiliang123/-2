//
//  MY_XTClubNoticeModel.h
//  VTIME
//
//  Created by tingting on 2017/10/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MY_XTClubNoticeModel : BaseModel

@property (strong, nonatomic) NSString* inviteUserNickName;

@property (strong, nonatomic) NSString* clubName;

@property (strong, nonatomic) NSDate* createTime;

@property (strong, nonatomic) NSNumber* dealResult;

@property (strong, nonatomic) NSDate* dealTime;

@property (strong, nonatomic) NSNumber* dealUserId;

@property (strong, nonatomic) NSNumber* onUserId;

@property (strong, nonatomic) NSString* onUserNickName;

@property (strong, nonatomic) NSString* onUserHeadIcon;

@property (strong, nonatomic) NSNumber* infoType;

@property (strong, nonatomic) NSString* dealUserNickName;

@property (strong, nonatomic) NSNumber* userid;

@property (strong, nonatomic) NSNumber* roomId;

@end
