//
//  MY_TTLNewPwopleGuideModel.m
//  VTIME
//
//  Created by Allen on 2017/12/22.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLNewPwopleGuideModel.h"

@implementation MY_TTLNewPwopleGuideModel
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self != nil)
    {
        _firstHomeWorld = [aDecoder decodeBoolForKey:@"HomeWorld"];
        _firstCallRed = [aDecoder decodeBoolForKey:@"CallRed"];
        _firstSetPlay = [aDecoder decodeBoolForKey:@"SetPlay"];
        _firstWorldRed = [aDecoder decodeBoolForKey:@"WorldRed"];
        _firstHomeRenwu = [aDecoder decodeBoolForKey:@"HomeRenwu"];
        _firstRenwuFaqi = [aDecoder decodeBoolForKey:@"RenwuFaqi"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:_firstHomeWorld forKey:@"HomeWorld"];
    [aCoder encodeBool:_firstCallRed forKey:@"CallRed"];
    [aCoder encodeBool:_firstSetPlay forKey:@"SetPlay"];
    [aCoder encodeBool:_firstWorldRed forKey:@"WorldRed"];
    [aCoder encodeBool:_firstHomeRenwu forKey:@"HomeRenwu"];
    [aCoder encodeBool:_firstRenwuFaqi forKey:@"RenwuFaqi"];
}
@end
