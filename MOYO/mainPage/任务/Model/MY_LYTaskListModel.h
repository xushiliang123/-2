//
//  TaskListModel.h
//  VTIME
//
//  Created by gll on 2017/12/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseModel.h"

/*
 
 nickName        String    昵称
 headIcon        String    头像
 distance        String    距离
 limitSex        int    性别限制 0女 1 男 2男女不限
 limitNum        int    人数限制
 createTime            创建时间
 tag        int    0就是与我无关 1就是我参与的 2就是我报名的 3我发布的
 expireTime            任务时间
 taskInfo        String    任务详情
 location        String    地点
 isAnonymously        int    是否匿名
 userId        int    发起人id
 money        double    钱
 sex        int    性别限制 0女 1 男
 nobleLevel        int    贵族等级 0为非贵族 1为贵族
 isAuthen        int    加V认证 0没有 1有
 pickNum        int    参与人数
 
 */


@interface MY_LYTaskListModel : BaseModel
    
@property (strong, nonatomic) NSNumber*taskId;
    
@property (strong, nonatomic) NSString* nickName;
@property (strong, nonatomic) NSString* distance;
@property (strong, nonatomic) NSString* headIcon;
    
@property (strong, nonatomic) NSNumber* limitSex;
@property (strong, nonatomic) NSNumber* limitNum;
@property (strong, nonatomic) NSNumber* createTime;
@property (strong, nonatomic) NSNumber* tagNum;
@property (strong, nonatomic) NSNumber* expireTime;
    
@property (strong, nonatomic) NSString* taskInfo;
@property (strong, nonatomic) NSString* location;
@property (strong, nonatomic) NSNumber* money;
@property (strong, nonatomic) NSNumber* isAnonymously;
@property (strong, nonatomic) NSNumber* userId;
    
@property (strong, nonatomic) NSNumber* sex;
@property (strong, nonatomic) NSNumber* nobleLevel;
@property (strong, nonatomic) NSNumber* isAuthen;
@property (strong, nonatomic) NSNumber* consumptionLevel;
    
@property (strong, nonatomic) NSNumber*distanceStatus;
@property (strong, nonatomic) NSString*region;
@property (strong, nonatomic) NSNumber*pickNum;
    
@property (assign, nonatomic) CGFloat decHeight;
    
@end
