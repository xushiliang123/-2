//
//  MY_TTLActiveHomeTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/9/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_GLHomeModel.h"
#import "MY_GLAlphaLabel.h"


/**
 * The style of cell cannot stop in screen center.
 * 播放滑动不可及cell的类型
 */
typedef NS_OPTIONS(NSInteger, JPPlayUnreachCellStyle) {
    JPPlayUnreachCellStyleNone = 1 << 0,  // normal 播放滑动可及cell
    JPPlayUnreachCellStyleUp = 1 << 1,    // top 顶部不可及
    JPPlayUnreachCellStyleDown = 1<< 2    // bottom 底部不可及
};


@interface MY_TTLActiveHomeTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView  *    backView;

@property (strong, nonatomic) UIImageView* imgvHead;

@property (strong, nonatomic) UIImageView* statusImg;//挂状态

@property (strong, nonatomic) MY_GLAlphaLabel * onlineStatus;//在线状态

@property (strong, nonatomic) UIImageView* imgvVip;

@property (strong, nonatomic) UILabel *    labelName;

//@property (strong, nonatomic) UIImageView* imgvVipLevel;
@property (strong, nonatomic) UILabel *    labelVipLevel;


@property (strong, nonatomic) UILabel *    labelAge;

@property (strong, nonatomic) UILabel *    labelStarSign;

@property (strong, nonatomic) UILabel *    labelHeight;

@property (strong, nonatomic) UILabel *    labelDistance;

@property (strong, nonatomic) UIButton*    btnAdd;

@property (strong, nonatomic) UILabel*    labelVideoAuthen;
@property (strong, nonatomic) UIButton*    imgVideoAuthen;//    视频认证


@property (strong, nonatomic) UIButton*    isPlayerBtn;//暂停播放

@property (strong, nonatomic) UIView  *    playCoverView;//灰色背景


/** videoPath */
@property(nonatomic, strong)NSString *videoPath;

/** indexPath */
@property(nonatomic, strong)NSIndexPath *indexPath;

/** cell类型 */
@property(nonatomic, assign)JPPlayUnreachCellStyle cellStyle;
@property(nonatomic,strong)MY_GLHomeModel * homeModel;

@property(nonatomic,copy)void(^KnownTaBlock)(MY_GLHomeModel * mod);

@end
