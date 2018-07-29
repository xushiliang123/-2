//
//  MY_GLOwnInfoHeaderView.h
//  VTIME
//
//  Created by gll on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MY_LYPersonInfoModel.h"
#import "MY_GLAlphaLabel.h"
#import "ZFPlayer.h"

@interface MY_GLOwnInfoHeaderView : UIView


@property (strong, nonatomic) UIImageView *headerImageView;//头像

@property (strong, nonatomic) UILabel *nickLabel;           //nick
@property (strong, nonatomic) UILabel *vipLevelLabel;      //Vip等级
@property (strong, nonatomic) UIImageView *AddVCerImgView;  //加 V 认证
@property (strong, nonatomic) UILabel *typeLabel;          //类型、模特
@property (strong, nonatomic) UIButton *attentionBtn;       //关注
@property (strong, nonatomic) UIButton *chatbtn;            //私聊
@property (strong, nonatomic) UIImageView *videoCerLabel;       //视频认证
@property (strong, nonatomic) MY_GLAlphaLabel *onlineStatus;  //在线状态

@property (strong, nonatomic) MY_LYPersonInfoModel *model;       //个人信息
@property (nonatomic, strong) UIVisualEffectView   *effectView;

@property (strong, nonatomic) ZFPlayerView   *playerView;           //播放器视图
//@property (nonatomic, strong) ZFPlayerControlView   * controlView;
/** 离开页面时候是否在播放 */
@property (nonatomic, assign) BOOL                    isPlaying;
//@property (nonatomic, strong) ZFPlayerModel         * playerModel;


@property (copy, nonatomic)void(^privateChatBlock)(NSInteger index,MY_LYPersonInfoModel *model);

@property (nonatomic, copy  ) void(^playBlock)(UIButton *);


@property (nonatomic, copy  ) void(^playBackBlock)(void);



@end



