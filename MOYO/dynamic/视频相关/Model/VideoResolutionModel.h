//
//  VideoResolutionModel.h
//  TogetherLu
//
//  Created by Louie on 2017/6/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"

@interface VideoResolutionModel : BaseModel

/*
 userId	必须	int	用户id
 nickName	必须	string	昵称
 headIcon	必须	string	头像
 qualifications	必须	int	资质
 sex	必须	int	性别
 age	必须	int	年龄
 gameLevel	必须	int	游戏等级
 consumptionLevel	必须	int	消费等级
 region	必须	string	地区
 createTime	必须	string	发表时间
 isfollow	必须	int	是否关注
 isclick	必须	int	是否点赞
 dynamic	必须	string	动态内容文字
 img	必须	string	动态内容图片（视频截图）
 did	必须	int	动态内容id
 comment	必须	string	评论
 views	必须	int	用户浏览量
 thumbNum	必须	int	点赞次数
 distance	必须	String	用户与发表该动态用户的距离
 distanceStatus	必须	int	隐身设置，0为开1为关
 dynamicType	必须	int	0为普通动态，1为视频动态
 videoLength	必须	int	视频长度
 videoUrl	必须	string	视频播放地址
 
 address = "";
 age = 22;
 autograph = "\U5feb\U6765\U627e\U6211\U4e00\U8d77\U73a9";
 comments = 0;
 constellation = "\U91d1\U725b\U5ea7";
 consumptionLevel = 0;
 createTime = 1505110703000;
 did = 2;
 distance = 12968;
 distanceStatus = 0;
 dynamicType = 0;
 followNum = 0;
 gameLevel = 0;
 giftNum = 0;
 headIcon = "/upload/images/212047917065192352323424971504691401004.png";
 img = "https://www.tingting365.com/upload/images/1495173679373.png";
 interest = "\U5973\U4eba";
 isAskSkin = 0;
 isAuthen = 0;
 isClick = 0;
 isFollow = 0;
 isQualification = 0;
 lastLoginTime = 1505201795000;
 latitude = "31.19489";
 longitude = "121.43782";
 nickName = "\U6ce2\U54e5";
 nobleLevel = 1;
 occupation = "\U62a4\U58eb";
 onFollowNum = 0;
 region = "\U4e0a\U6d77";
 secretStatus = 1;
 sex = 1;
 thumbNum = 0;
 userId = 2120485;
 videoHeight = 0;
 videoLength = 0;
 videoNum = 0;
 videoWidth = 0;
 views = 0;
 */


@property (nonatomic, strong) NSNumber * userId;            //   用户id
@property (nonatomic, strong) NSString * nickName;          //   昵称
@property (nonatomic, strong) NSString * headIcon;          //   头像
@property (nonatomic, strong) NSNumber * isQualification;   //   资质
@property (nonatomic, strong) NSNumber * sex;               //   性别
@property (nonatomic, strong) NSNumber * age;               //   年龄
@property (nonatomic, strong) NSNumber * consumptionLevel;  //   消费等级
@property (nonatomic, strong) NSString * region;            //   地区
@property (nonatomic, strong) NSNumber * createTime;        //   发表时间
@property (nonatomic, strong) NSNumber * isFollow;          //   是否关注
@property (nonatomic, strong) NSNumber * isClick;           //   是否点赞
@property (nonatomic, strong) NSString * content;           //   动态内容文字
@property (nonatomic, strong) NSString * img;               //   动态内容图片（视频截图）
@property (nonatomic, strong) NSNumber * did;               //   动态内容id
@property (nonatomic, strong) NSNumber * comments;          //   评论数
@property (nonatomic, strong) NSNumber * viewNum;           //   用户浏览量
@property (nonatomic, strong) NSNumber * thumbNum;          //   点赞次数
@property (nonatomic, strong) NSString * distance;          //   用户与发表该动态用户的距离
@property (nonatomic, strong) NSNumber * distanceStatus;    //   隐身设置，0为开1为关
@property (nonatomic, strong) NSNumber * dynamicType;       //   0为普通动态，1为视频动态
@property (nonatomic, strong) NSString * videoUrl;          //   视频播放地址
@property (nonatomic, assign) NSInteger  videoLength;       //   视频时长
@property (nonatomic, assign) NSInteger  videoHeight;       //   视频高度
@property (nonatomic, assign) NSInteger  videoWidth;        //   视频宽度
@property (strong, nonatomic) NSNumber * isAuthen;          //   加V认证
@property (strong, nonatomic) NSNumber * secretStatus;      //   隐私设置 0为开，1为关
@property (strong, nonatomic) NSNumber * nobleLevel;        //   是否是贵族
@property (nonatomic, strong) NSDecimalNumber * encourageMoney;
@property (strong, nonatomic) NSNumber * msgType;           //   0点赞 1红包
@property (nonatomic, assign) NSInteger isNoble;

@property (nonatomic, assign) CGFloat    dynamicHeight;     //   动态文字高度

@property (nonatomic, strong) NSArray  * type;               //  所有服务类型

@end
