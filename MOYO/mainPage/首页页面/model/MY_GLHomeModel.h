//
//  MY_GLHomeModel.h
//  VTIME
//
//  Created by gll on 2017/9/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 首页Model */

@interface MY_GLHomeModel : BaseModel



@property (strong, nonatomic) NSNumber* userId;

@property (strong, nonatomic) NSString* nickName;

@property (strong, nonatomic) NSNumber* sex;

@property (strong, nonatomic) NSNumber* age;

@property (strong, nonatomic) NSNumber* height;

@property (strong, nonatomic) NSNumber* distance;

@property (strong, nonatomic) NSNumber* lastLoginTime;//最后登录时间

@property (strong, nonatomic) NSNumber* isVideoVerify;//是否视频认证

@property (strong, nonatomic) NSString* constellation;//星座

@property (strong, nonatomic) NSNumber* statement;  //挂状态

@property (strong, nonatomic) NSNumber* consumptionLevel;  //vip等级

@property (strong, nonatomic) NSNumber* nobleLevel;    //贵族等级

@property (strong, nonatomic) NSString* isAuthen;  //是否加V认证

@property (strong, nonatomic) NSString* certificationName ;   //加V认证名称

@property (strong, nonatomic) NSNumber* isQualification;       //是否实名认证

@property (strong, nonatomic) NSString* interest;  //爱好

@property (strong, nonatomic) NSString* style;//风格

@property (strong, nonatomic) NSNumber* secretStatus;// 隐私设置

@property (strong, nonatomic) NSString* region;//地区

@property (strong, nonatomic) NSString* headIcon;


@property (strong, nonatomic) NSString* indexIcon;//视频封面图

@property (strong, nonatomic) NSString* indexVideo;//视频地址

@property (strong, nonatomic) NSNumber* videoLength; //视频播放长度

@property (strong, nonatomic) NSNumber*  videoHeight;//视频画面高

@property (strong, nonatomic) NSNumber* videoWidth;//视频画面宽

@property (strong, nonatomic) NSNumber* isFriend;//是否相互关注



- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
