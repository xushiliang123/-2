//
//  BlacklistModel.h
//  TogetherLu
//
//  Created by Louie on 17/2/16.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"

@interface BlacklistModel : BaseModel

@property (nonatomic, strong)NSNumber * userId;                 //  自己的id
@property (nonatomic, strong)NSNumber * sex;
@property (nonatomic, strong)NSNumber * age;
@property (strong, nonatomic)NSNumber *height;
@property (strong, nonatomic)NSNumber *distance;


@property (nonatomic, strong)NSString * headIcon;
@property (nonatomic, strong)NSString * nickName;
@property (strong, nonatomic)NSNumber *lastLoginTime;
@property (strong, nonatomic)NSNumber *isVideoVerify;

@property (strong, nonatomic)NSNumber *constellation;   //星座

@property (strong, nonatomic)NSNumber *statement;       //挂状态

@property (strong, nonatomic)NSNumber *consumptionLevel;    //vip等级

@property (strong, nonatomic)NSNumber *nobleLevel;      //贵族等级

@property (strong, nonatomic)NSNumber *isAuthen;        //是否加V

@property (strong, nonatomic)NSString *certificationName;   //加v名称




@property (nonatomic, strong)NSString * interest;       //爱好
@property (nonatomic, strong)NSNumber * style;          //风格
@property (nonatomic, strong)NSNumber * occupation;     //职业

@end


//headIcon: "https://www.tingting365.com/upload/images/1484965096323.png",
//sex: 1,
//autograph: "6666666666666666",
//nickName: "will",
//age: 20,
//userId: 10028,
//consumptionLevel: 5,
//isQualification: 1,
//onUserId: 10015
