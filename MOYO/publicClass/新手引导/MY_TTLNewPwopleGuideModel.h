//
//  MY_TTLNewPwopleGuideModel.h
//  VTIME
//
//  Created by Allen on 2017/12/22.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseModel.h"

@interface MY_TTLNewPwopleGuideModel : BaseModel<NSCoding>

#pragma mark ----- 男 -----
// 首页世界频道
@property (nonatomic, assign)BOOL firstHomeWorld;
// 世界频道红包
@property (nonatomic, assign)BOOL firstWorldRed;
// 首页任务
@property (nonatomic, assign)BOOL firstHomeRenwu;
// 任务列表
@property (nonatomic, assign)BOOL firstRenwuFaqi;
// 私聊界面
@property (nonatomic, assign)BOOL firstCallRed;
// 设置
@property (nonatomic, assign)BOOL firstSetPlay;

#pragma mark ----- 女 -----

@end
