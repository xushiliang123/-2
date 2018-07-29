//
//  BarrageModel.h
//  TogetherLu
//
//  Created by Louie on 2017/6/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"

@interface BarrageModel : BaseModel


@property (nonatomic, strong) NSNumber *fid;            //  唯一标示
@property (nonatomic, strong) NSNumber *gid;            //  礼物id
@property (nonatomic, strong) NSString *gname;          //  礼物名称
@property (nonatomic, strong) NSString *giftUrl;        //  礼物图片
@property (nonatomic, strong) NSString *giftUnits;      //  礼物单位
@property (nonatomic, strong) NSNumber *num;            //  数量
@property (nonatomic, strong) NSNumber *createTime;     //  时间戳	赠送时间
@property (nonatomic, strong) NSString *headIcon;       //  送礼人头像
@property (nonatomic, strong) NSString *nickName;       //  昵称
@property (nonatomic, strong) NSNumber *userId;         //  用户id
@property (nonatomic, strong) NSString *comment;        //  评论内容
@property (nonatomic, strong) NSNumber *onUserId;       //  送礼用户id
@property (nonatomic, strong) NSString *onNickName;     //  送礼人昵称
@property (nonatomic, strong) NSNumber *replyType;      //  0 评论  1 回复
@property (nonatomic, strong) NSNumber *type;           //  1评论，2送礼
@property (nonatomic, strong) NSNumber *showTime;       //  本条弹幕展示时间（相对与视频开始时间点）
@property (nonatomic, strong) NSString *barageColor;    //  本条弹幕颜色

/*
 fid	是	int	唯一标示
 gid	否	int	礼物id
 gname	否	string	礼物名称
 giftUrl	否	string	礼物图片
 giftUnits	否	string	礼物单位
 num	否	int	数量
 createTime	是	long时间戳	赠送时间
 headIcon	否	string	送礼人头像
 nickName	是	string	昵称
 userId	是	int	用户id
 comment	否	string	评论内容
 onUserId	否	int	送礼用户id
 onNickName	否	string	送礼人昵称
 replyType	是	int	0 评论  1 回复
 type	是	int	1评论，2送礼
 showTime	是	long	本条弹幕展示时间（相对与视频开始时间点）
 barageColor	是	String	本条弹幕颜色
 */

@end
