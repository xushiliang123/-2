//
//  MY_LLPersonInfoModel.m
//  VTIME
//
//  Created by Louie on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYPersonInfoModel.h"

@implementation MY_LYPersonInfoModel
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {

        _userId = [(NSNumber*)[aDecoder decodeObjectForKey:@"userId"] integerValue];
        _nickName = [aDecoder decodeObjectForKey:@"nickName"];
        _headIcon = [aDecoder decodeObjectForKey:@"headIcon"];
        _userName = [aDecoder decodeObjectForKey:@"userName"];
        _consumptionLevel = [[aDecoder decodeObjectForKey:@"consumptionLevel"] integerValue];
        _latitude =  [aDecoder decodeObjectForKey:@"latitude"];
        _longitude =  [aDecoder decodeObjectForKey:@"longitude"];
        _region = [aDecoder decodeObjectForKey:@"region"];
        _age =  [[aDecoder decodeObjectForKey:@"age"] integerValue];
        _sex =  [[aDecoder decodeObjectForKey:@"sex"] integerValue];
        _distance = [aDecoder decodeObjectForKey:@"distance"];
        _isNoble = [[aDecoder decodeObjectForKey:@"isNoble"] integerValue];
        _inIndex = [aDecoder decodeObjectForKey:@"inIndex"];
        _available = [[aDecoder decodeObjectForKey:@"available"] integerValue];
        _pullNum = [[aDecoder decodeObjectForKey:@"pullNum"] integerValue];
        _inviteNum = [[aDecoder decodeObjectForKey:@"inviteNum"] integerValue];
        _secretStatus = [aDecoder decodeObjectForKey:@"secretStatus"];
        _secretIcon =  [aDecoder decodeObjectForKey:@"secretIcon"];

        _mobileNum =  [[aDecoder decodeObjectForKey:@"mobileNum"] integerValue];
        
        _selectRegion = [aDecoder decodeObjectForKey:@"selectRegion"];
        _isCanChat = [[aDecoder decodeObjectForKey:@"isCanChat"] integerValue];
        _isForbidden = [aDecoder decodeObjectForKey:@"isForbidden"];
        _iscreateClub =  [aDecoder decodeObjectForKey:@"iscreateClub"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:@(_userId) forKey:@"userId"];
    [aCoder encodeObject:_nickName forKey:@"nickName"];
    [aCoder encodeObject:_headIcon forKey:@"headIcon"];
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeObject:@(_consumptionLevel) forKey:@"consumptionLevel"];
    [aCoder encodeObject:_latitude forKey:@"latitude"];
    [aCoder encodeObject:_longitude forKey:@"longitude"];
    [aCoder encodeObject:_region forKey:@"region"];
    [aCoder encodeObject:@(_age) forKey:@"age"];
    [aCoder encodeObject:@(_sex) forKey:@"sex"];
    [aCoder encodeObject:_distance forKey:@"distance"];
    [aCoder encodeObject:@(_isNoble) forKey:@"isNoble"];
    [aCoder encodeObject:@(_available) forKey:@"available"];
    [aCoder encodeObject:@(_pullNum) forKey:@"pullNum"];
    [aCoder encodeObject:@(_inviteNum) forKey:@"inviteNum"];
    
    [aCoder encodeObject:_secretStatus forKey:@"secretStatus"];
    [aCoder encodeObject:_secretIcon forKey:@"secretIcon"];
    [aCoder encodeObject:@(_mobileNum) forKey:@"mobileNum"];
    [aCoder encodeObject:_selectRegion forKey:@"selectRegion"];
    
    [aCoder encodeObject:_inIndex forKey:@"inIndex"];
    
    [aCoder encodeObject:@(_isCanChat) forKey:@"isCanChat"];
    [aCoder encodeObject:_isForbidden forKey:@"isForbidden"];
    [aCoder encodeObject:_iscreateClub forKey:@"iscreateClub"];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    if([key isEqualToString:@"id"]){
//            self.userId = (NSNumber*)value;
//    }
}

+ (NSString *)getTableName{
    return NSStringFromClass(self);
}
+ (NSString *)getPrimaryKey{
    return @"userId";
}


@end
