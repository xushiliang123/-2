//
//  MY_GLTaskApplyModel.h
//  VTIME
//
//  Created by gll on 2017/12/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseModel.h"

/*
 
 id                int    用户id
 headIcon          String    头像
 consumptionLevel  int    消费等级
 nickName          String    昵称
 isAuthen          int    加V认证 0不加 1 加了
 nobleLevel        int    贵族等级0不是贵族
 status            int    1同意 2未同意 4拒绝
 
 */

@interface MY_LYTaskApplyModel : BaseModel
    
@property (strong, nonatomic) NSString* nickName;
@property (strong, nonatomic) NSNumber* status;
@property (strong, nonatomic) NSString* headIcon;
@property (strong, nonatomic) NSNumber* nobleLevel;
@property (strong, nonatomic) NSNumber* isAuthen;
@property (strong, nonatomic) NSNumber* consumptionLevel;
@property (strong, nonatomic) NSNumber* userId;
@end
