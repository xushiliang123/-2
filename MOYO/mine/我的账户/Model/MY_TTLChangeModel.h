//
//  MY_TTLChangeModel.h
//  TogetherLu
//
//  Created by MadridLee on 2017/4/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"

@interface MY_TTLChangeModel : BaseModel
@property (strong, nonatomic) NSNumber* coin;    //充值玩币

@property (strong, nonatomic) NSNumber* balance;    //充值余额

@property (strong, nonatomic) NSNumber* gold;       //提现余额

@property (strong, nonatomic) NSNumber* isBindAlipay;   //是否绑定支付宝

@property (strong, nonatomic) NSString* realName;      //真是姓名

@property (strong, nonatomic) NSNumber* alipayCardNo;      //支付宝账号

@property (strong, nonatomic) NSString* bankCity;       //开户城市

@property (strong, nonatomic) NSString* bankCityBranch; //开户支行

@property (strong, nonatomic) NSString* bankName; //银行名字

@property (strong, nonatomic) NSNumber* bankNo; //银行卡号

@property (strong, nonatomic) NSString* bankUserName; //户名

@property (strong, nonatomic) NSNumber* isBindBank;

@property (strong, nonatomic) NSNumber* isQualification;   //是否实名认证

@property (strong, nonatomic) NSNumber* status;

@property (strong, nonatomic) NSNumber* userId;      //钱包状态

@property (strong, nonatomic) NSNumber* mobileNum;      //手机号



@end
