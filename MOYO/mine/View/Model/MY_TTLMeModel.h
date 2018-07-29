//
//  MY_TTLMeModel.h
//  TogetherLu
//
//  Created by MadridLee on 2017/1/5.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"

@interface MY_TTLMeModel : BaseModel

@property (strong, nonatomic) NSNumber* userId;

@property (strong, nonatomic) NSString* userTag;    //标签

@property (strong, nonatomic) NSNumber* sex;

@property (strong, nonatomic) NSNumber* age;

@property (strong, nonatomic) NSNumber* height;

@property (strong, nonatomic) NSNumber* distance;

@property (strong, nonatomic) NSString* headIcon;

@property (strong, nonatomic) NSString* nickName;

@property (strong, nonatomic) NSNumber* lastlogintime;  //最后登录时间

@property (strong, nonatomic) NSNumber* isVideoVerify;  //是否视频认证

@property (strong, nonatomic) NSString* constellation;  //星座

@property (strong, nonatomic) NSNumber* statement;  //挂状态

@property (strong, nonatomic) NSNumber* consumptionLevel;   //VIP等级

@property (strong, nonatomic) NSNumber* nobleLevel;   //贵族等级

@property (strong, nonatomic) NSNumber* isAuthen;   //是否加v认证  -1为尚未申请认证，0为审核中，1为审核通过，2为审核未通过

@property (strong, nonatomic) NSString* certificationName;  //加V认证名称

@property (strong, nonatomic) NSString* interest;//兴趣

@property (strong, nonatomic) NSString* style;//风格

@property (strong, nonatomic) NSString* occupation;//职业

@property (strong, nonatomic) NSNumber* money;//余额

@property (strong, nonatomic) NSNumber* moneyBack;  //可提现余额 = 收益

@property (strong, nonatomic) NSNumber* hongbaoGetMoney;  //红包收益

@property (strong, nonatomic) NSNumber* moneyIncomeGet;  //邀请抽成

@property (strong, nonatomic) NSNumber* moneyIncomeSend;  //消费抽成

@property (strong, nonatomic) NSNumber* isCreateClub;  //是否创建俱乐部
@property (strong, nonatomic) NSNumber* other;  //其它收益

@property (assign, nonatomic) NSInteger available;             //  0 不可以看 1 可以看
@property (assign, nonatomic) NSInteger inviteNum;             //  已经邀请的人数
@property (strong, nonatomic) NSNumber* secretStatus;   //资料是否保密
@end

