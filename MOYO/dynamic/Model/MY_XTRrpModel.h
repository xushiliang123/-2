//
//  MY_XTRrpModel.h
//  VTIME
//
//  Created by tingting on 2017/11/21.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MY_XTRrpModel : BaseModel

@property (nonatomic, strong) NSNumber * consumptionLevel;
@property (nonatomic, strong) NSNumber * createTime;
@property (nonatomic, strong) NSNumber * did;
@property (nonatomic, strong) NSNumber * dynamicType;
@property (nonatomic, strong) NSNumber * encourageMoney;
@property (nonatomic, strong) NSString * headIcon;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSNumber * isClick;
@property (strong, nonatomic) NSNumber * isAuthen;
@property (nonatomic, strong) NSNumber * isEssence;
@property (strong, nonatomic) NSNumber * isFollow;
@property (nonatomic, strong) NSNumber * msgType;
@property (nonatomic, strong) NSString * nickName;
@property (strong, nonatomic) NSNumber * nobleLevel;
@property (nonatomic, strong) NSNumber * userId;
@property (nonatomic, strong) NSNumber * thumbNum;
@property (strong, nonatomic) NSNumber * secretStatus;
@property (strong, nonatomic) NSNumber * playNum;
@property (nonatomic, assign) NSInteger  videoLength;
@property (nonatomic, assign) NSInteger  videoHeight;
@property (nonatomic, assign) NSInteger  videoWidth;
@property (nonatomic, strong) NSNumber * viewNum;

@property (nonatomic, assign) CGFloat    dynamicHeight;     //   动态文字高度

@end
