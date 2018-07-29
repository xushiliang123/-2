//
//  MY_LLPersonInfoModel.h
//  VTIME
//
//  Created by Louie on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "ChineseString.h"


@interface MY_LYPersonInfoModel : BaseModel<NSCoding>



@property (nonatomic, assign) NSInteger userId;                //  用户id
//@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *userName;              //  userName
@property (nonatomic, assign) NSInteger mobileNum;             //  手机号
@property (nonatomic, strong) NSString *nickName;              //  昵称

@property (nonatomic, strong) NSString *headIcon;              //  头像
@property (nonatomic, assign) NSInteger sex;                   //  性别 0:女 1:男
@property (nonatomic, assign) NSInteger age;                   //  年龄
@property (nonatomic, assign) NSInteger consumptionLevel;      //  消费等级
@property (nonatomic, strong) NSString *region;                //  地区
@property (nonatomic, assign) long long lastLoginTime;         //  时间戳,毫秒(long)最后登录时间
@property (nonatomic, strong) NSString *constellation;         //  星座
@property (nonatomic, strong) NSString *occupation;            //  职业
@property (nonatomic, strong) NSString *style;                 //  风格
@property (nonatomic, strong) NSString *interest;              //  兴趣
@property (nonatomic, strong) NSString *hxusername;            //  环信账号
@property (nonatomic, strong) NSString *hxpassword;            //  环信密码
@property (nonatomic, assign) NSInteger isEdit;                //  是否编辑过资料
@property (nonatomic, assign) NSInteger height;                //  身高
@property (strong, nonatomic) NSNumber* distance;              //  距离
@property (nonatomic, assign) NSInteger isAuthen;              //  V认证
@property (nonatomic, assign) NSInteger isFriend;              //  相互关注  1是 0否
@property (assign, nonatomic) NSInteger isVideoVerify;         //  是否视频认证
@property (strong, nonatomic) NSString* certificationName ;    //  加V认证名称
@property (strong, nonatomic) NSString* indexVideo;            //  视频地址
@property (nonatomic, assign) NSInteger isFollow;              //  关注
@property (assign, nonatomic) NSInteger nobleLevel;            //  是否是VIP
@property (assign, nonatomic) NSInteger available;             //  0 不可以看 1 可以看
@property (assign, nonatomic) NSInteger inviteNum;             //  已经邀请的人数
@property (assign, nonatomic) NSInteger pullNum;               //  总共可以需要邀请得人
@property (assign, nonatomic) NSInteger isNoble;       //是否贵族
@property (strong, nonatomic) NSNumber * inIndex;       //是否上首页     是1 就是艺人

@property (strong, nonatomic) NSString*longitude;               //经纬度
@property (strong, nonatomic) NSString*latitude;
@property (copy, nonatomic) NSString* selectRegion;    //选择城市

@property (assign, nonatomic) NSInteger  videoHeight;//视频画面高
@property (assign, nonatomic) NSInteger videoWidth;//视频画面宽
@property (strong, nonatomic) NSString* indexIcon;//视频封面图

@property (strong, nonatomic) ChineseString* chineseString;

@property (strong, nonatomic) NSArray* type;

@property (strong, nonatomic) NSNumber* secretStatus;  //隐身状态
@property (copy, nonatomic) NSString* secretIcon;   //隐身头像
@property (strong, nonatomic) NSDictionary* club;

@property (nonatomic, assign) NSInteger isCanChat;  // 1 收到红包  2红包过期 首次聊天收到招呼红包 11.30
@property (nonatomic, assign) NSNumber *isForbidden;  // 封号 0代表正常 1代表被禁止

@property (nonatomic, strong) NSNumber * iscreateClub;//    是否创建俱乐部

@end





/*
 userId	必须	int	用户id
 nickName	必须	string	昵称
 headIcon	必须	string	头像
 sex	必须	int	性别 0:女 1:男
 age	必须	int	年龄
 consumptionLevel	必须	int	消费等级
 region	必须	string	地区
 lastLoginTime	必须	时间戳，到毫秒(long)	最后登录时间
 constellation	可选	string	星座
 occupation	可选	string	职业
 style	可选	string	风格
 interest	可选	string	兴趣
 hxusername	是	string	环信账号
 hxpassword	是	string	环信密码
 isEdit		int	是否编辑过资料
 height		int	身高
 isNoVerify
 */
