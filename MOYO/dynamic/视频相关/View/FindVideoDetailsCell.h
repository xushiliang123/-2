//
//  FindVideoDetailsCell.h
//  TogetherLu
//
//  Created by Louie on 2017/6/18.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFPlayer.h"

@interface FindVideoDetailsCell : UITableViewCell

@property (nonatomic, strong) UIImageView           * headView;             //头部视图
@property (nonatomic, strong) UILabel               * regionLabel;          //时间&地址
@property (nonatomic, strong) UILabel               * worksNumberLabel;     //作品数
@property (nonatomic, strong) UIButton              * avatarBtn;            //头像
@property (nonatomic, strong) UILabel               * nameLabel;            //昵称
@property (nonatomic, strong) UIButton              * attentionBtn;         //关注按钮
@property (nonatomic, strong) UILabel               * dynamicLabel;         //动态文字
@property (strong, nonatomic) UIButton              * playBtn;

@property (nonatomic, strong) UIVisualEffectView   * effectView;


/** 播放按钮block */
@property (nonatomic, copy  ) void(^playBlock)(UIButton *);

@end
