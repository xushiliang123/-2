//
//  MY_GLClubUserModel.h
//  VTIME
//
//  Created by tingting on 2017/10/17.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MY_GLClubUserModel : BaseModel

@property (strong, nonatomic) NSNumber* rankType;
@property (strong, nonatomic) NSNumber* userId;
@property (strong, nonatomic) NSString* headIcon;
@property (strong, nonatomic) NSString* nickName;

@end
