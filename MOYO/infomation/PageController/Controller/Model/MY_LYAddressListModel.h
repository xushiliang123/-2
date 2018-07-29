//
//  MY_LLAddressListModel.h
//  VTIME
//
//  Created by Louie on 2017/9/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseModel.h"
#import "ChineseString.h"

@interface MY_LYAddressListModel : BaseModel


@property (strong, nonatomic) NSNumber* age;            //年龄
@property (strong, nonatomic) NSNumber* userId;         //
@property (strong, nonatomic) NSString* nickName;       //昵称
@property (strong, nonatomic) NSString* headIcon;       //头像
@property (strong, nonatomic) NSNumber* sex;            //性别
@property (strong, nonatomic) NSNumber* consumptionLevel;//消费等级
@property (strong, nonatomic) NSNumber* distance;        //距离
@property (strong, nonatomic) NSNumber* isQualification; //是否认证
@property (strong, nonatomic) NSString* autograph;       //签名
@property (strong, nonatomic) NSNumber* lastLoginTime;   //最后登录时间
@property (strong, nonatomic) NSString* region;          //地点
@property (strong, nonatomic) NSNumber* isOnline;        //是否线上lol
@property (strong, nonatomic) NSNumber* isLine;          //是否线下lol
@property (strong, nonatomic) NSNumber* isAkira;         //是否声优陪聊
@property (assign, nonatomic) CGSize    disSize;         //是否声优陪聊
@property (strong, nonatomic) NSNumber* distanceStatus;   //距离开关状态
@property (strong, nonatomic) ChineseString* chineseString;

@property (strong, nonatomic) NSArray* type;
@property (strong, nonatomic) NSNumber* isAuthen;

@property (strong, nonatomic) NSNumber* secretStatus;


@end
