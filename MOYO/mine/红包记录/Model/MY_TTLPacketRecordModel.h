//
//  MY_TTLPacketRecordModel.h
//  VTIME
//
//  Created by MadridLee on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseModel.h"

@interface MY_TTLPacketRecordModel : BaseModel

@property (strong, nonatomic) NSNumber* onUserId;   //接受者id

@property (strong, nonatomic) NSNumber* userId;   //接受者id

@property (strong, nonatomic) NSString* headIcon;   //接受者头像

@property (strong, nonatomic) NSString* nickName;   //接受者逆臣

@property (strong, nonatomic) NSString* onUuserIdHeadIcon;   //接收者头像

@property (strong, nonatomic) NSString* onUserIdNickName;   //接受者昵称

@property (strong, nonatomic) NSNumber* money;   //红包金额

@property (strong, nonatomic) NSNumber* createTime;   //发红包时间

@property (strong, nonatomic) NSNumber* expireTime;   //过期时间

@property (strong, nonatomic) NSNumber* type;   //1招呼红包  2邀请红包 3群红包

@property (strong, nonatomic) NSNumber* num;   //数量

@property (strong, nonatomic) NSNumber* grepNum;   //领取数量



@end
