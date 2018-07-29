//
//  MAAnnotationCluster.h
//  officialDemo2D
//
//  Created by Jason-autonavi on 15/3/11.
//  Copyright (c) 2015年 AutoNavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>


@interface MAAnnotationCluster : NSObject <MAAnnotation>

/// Coordinate of the annotation(cluster).
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

/// Title of the annotation. Default is \c nil.
@property (nonatomic, copy  ) NSString *title;

/// Subtitle of the annotation. Default is \c nil.
@property (nonatomic, copy  ) NSString *subtitle;

/// Array of the annotations that are representer with this cluster.
@property (nonatomic, strong) NSArray  *annotations;


@property (nonatomic, copy) NSString * nickName;    //  昵称
@property (nonatomic, copy) NSString * region;      //  上海
@property (nonatomic, copy) NSString * level;       //  全部
@property (nonatomic, copy) NSString * headIcon;    //  头像
@property (nonatomic, copy) NSString * constellation;// 星座

@property (nonatomic, strong) NSNumber * isQualification;
@property (nonatomic, strong) NSNumber * userId;
@property (nonatomic, strong) NSNumber * sex;        // 8 是我自己的
@property (nonatomic, strong) NSNumber * consumptionLevel;
@property (nonatomic, strong) NSNumber * distance;
@property (nonatomic, strong) NSNumber * lastLoginTime;
@property (nonatomic, strong) NSNumber * latitude;
@property (nonatomic, strong) NSNumber * price;
@property (nonatomic, strong) NSNumber * secretStatus;
@property (nonatomic, strong) NSNumber * isVoice;
@property (nonatomic, strong) NSNumber * typeId;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * longitude;
@property (nonatomic, strong) NSNumber * distanceStatus;
@property (nonatomic, strong) NSNumber * isAuthen;
@property (nonatomic, strong) NSNumber * nobleLevel;
@property (nonatomic, strong) NSNumber * age;
@property (nonatomic, strong) NSNumber * isVedio;
@property (nonatomic, strong) NSNumber * height;

/*
 [0]	(null)	@"level" : @"全部"
 [1]	(null)	@"isQualification" : (int)1
 [2]	(null)	@"region" : @"上海"
 [3]	(null)	@"userId" : (long)2120369
 [4]	(null)	@"sex" : (int)0
 [5]	(null)	@"consumptionLevel" : (long)17
 [6]	(null)	@"distance" : @"0.1"
 [7]	(null)	@"lastLoginTime" : (long)1502290724000
 [8]	(null)	@"latitude" : (double)31.1649
 [9]	(null)	@"nickName" : @"我不知会遇见你、"
 [10]	(null)	@"price" : (double)59
 [11]	(null)	@"secretStatus" : (int)1
 [12]	(null)	@"isVoice" : (int)1
 [13]	(null)	@"typeId" : (long)1100
 [14]	(null)	@"num" : (int)5
 [15]	(null)	@"longitude" : (double)121.394
 [16]	(null)	@"distanceStatus" : (int)0
 [17]	(null)	@"isAuthen" : (int)1
 [18]	(null)	@"headIcon" : @"http://123.59.69.252/upload/images/15019140789222120369-41013330060041866241501914078922.jpg"
 [19]	(null)	@"age" : (long)20
 [20]	(null)	@"isVedio" : (int)1
 */

@end
