//
//  MY_GLClubModel.h
//  VTIME
//
//  Created by tingting on 2017/10/17.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 createTime = 1508317007000;
 fourGuest = "";
 income = 0;
 level = 1;
 limitNum = 10;
 location = "\U4e0a\U6d77";
 position = 0;
 rankType = 0;
 roomGroupId = 30323357319169;
 roomHeadIcon = "http://123.59.69.252/upload/images/sm_2120549-59992584968173655961508413405143.png";
 roomIcon = "http://123.59.69.252/upload/images/2120549-59992584968173655961508413405143.png";
 roomId = 2120549;
 roomInfo = Qqqqq555;
 roomName = Happy23;
 showRoomId = 2120549;
 status = 0;
 stopInput = 0;
 theme = 0;
 type = 0;
 userId = 2120549;
 userNum = 3;
 */

@interface MY_GLClubModel : BaseModel
@property (copy, nonatomic) NSString* roomGroupId;
@property (strong, nonatomic) NSNumber* roomId;
@property (strong, nonatomic) NSString* roomName;
@property (strong, nonatomic) NSNumber* userNum;
@property (strong, nonatomic) NSNumber* limitNum;
@property (strong, nonatomic) NSNumber* level;
@property (strong, nonatomic) NSString* roomHeadIcon;
@property (strong, nonatomic) NSString* roomInfo;
@property (strong, nonatomic) NSString* location;
@property (strong, nonatomic) NSString* textMss;
@property (strong, nonatomic) NSNumber* textWidth;
@property (strong, nonatomic) NSNumber* isAddClub;

@end
