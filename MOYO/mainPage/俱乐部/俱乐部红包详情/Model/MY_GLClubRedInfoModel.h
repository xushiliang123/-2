//
//  MY_GLClubRedInfoModel.h
//  VTIME
//
//  Created by gll on 2017/10/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseModel.h"

/* 红包详情 */

@class MY_GLClubRedListModel;

@interface MY_GLClubRedInfoModel : BaseModel

/*
 nickName = "\U6ce2\U54e5";
 num = 13; 红包数量
 totalMoney = 1000; 总共的钱
 userId = 2120485; 发红包的用户id
 grepNum = 13;
 headIcon = "http://123.59.69.252/vtime/v_hide_face.png";
 list
 
 */

@property (nonatomic, strong) NSString *nickName;

@property (nonatomic, strong) NSNumber *num;
@property (nonatomic, strong) NSNumber *totalMoney;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *grepNum;

@property (nonatomic, strong) NSString *headIcon;//title
@property (nonatomic, strong) NSMutableArray <MY_GLClubRedListModel *> * list;

@end


@interface MY_GLClubRedListModel : BaseModel

/*
 
 consumptionLevel = 0;
 createTime = 1507794973000;
 headIcon = "http://123.59.69.252/upload/images/15005328028212120363-22063282478583978221500532802821.jpg";
 hid = 108;
 money = "49.22";
 nickName = "\U6ce2\U54e5";
 userId = 2120485;
 
 
 userId    是    int
 hid    是    int    红包id
 money    是    double    钱
 nickName    是    string    昵称
 headIcon    是    string    头像
 createTime    是    long    抢的时间
 consumptionLevel    是    int    消费等级
  */

@property (nonatomic, strong) NSString *nickName;//title

@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *hid;
@property (nonatomic, strong) NSNumber *money;
@property (nonatomic, strong) NSNumber *createTime;

@property (nonatomic, strong) NSString *headIcon;
@property (nonatomic, strong) NSNumber *consumptionLevel;

@property (strong, nonatomic) NSNumber* nobleLevel;

@property (strong, nonatomic) NSNumber* isAuthen;

@end
