//
//  MY_TTLIncomeModel.h
//  VTIME
//
//  Created by MadridLee on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseModel.h"

@interface MY_TTLIncomeModel : BaseModel


@property (strong, nonatomic) NSString* des;    //消费描述

@property (strong, nonatomic) NSNumber* money;    //剩余金额

@property (strong, nonatomic) NSNumber* moneyBack;    //剩余返点金额

@property (strong, nonatomic) NSNumber* moneyChange;    //本次消费金额

@property (strong, nonatomic) NSString* createTime;    //消费时间

@property (strong, nonatomic) NSNumber* changeType;     //0 收入 1 消费

@property (strong, nonatomic) NSNumber* moneyBackChange;    // 收入&消费金额

@end
