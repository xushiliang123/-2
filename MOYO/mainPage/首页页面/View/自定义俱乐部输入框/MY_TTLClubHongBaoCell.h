//
//  MY_TTLClubHongBaoCell.h
//  VTIME
//
//  Created by 听听 on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "EaseMessageCell.h"
@class LXDTextView;
#import "IMessageModel.h"

#import "EaseBubbleView.h"

/** @brief 缩略图宽度(当缩略图宽度为0或者宽度大于高度时) */
#define kEMMessageImageSizeWidth 120
/** @brief 缩略图高度(当缩略图高度为0或者宽度小于高度时) */
#define kEMMessageImageSizeHeight 120
/** @brief 位置消息cell的高度 */
#define kEMMessageLocationHeight 95
/** @brief 语音消息cell的高度 */
#define kEMMessageVoiceHeight 19

@protocol ClubHongBaoCellDelegate <NSObject>

@optional
/*
 *  消息点击回调
 *
 *  @param  消息model
 */
- (void)messageCellSelected:(id<IMessageModel>)model withCell:(EaseMessageCell *)cell;

/*
 *  状态按钮点击回调
 *
 *  @param  消息model
 *  @param  当前cell
 */
- (void)statusButtonSelcted:(id<IMessageModel>)model withMessageCell:(EaseMessageCell*)messageCell;
/*
 *  头像点击回调
 *
 *  @param  消息model
 */
- (void)avatarViewSelcted:(id<IMessageModel>)model;

-(void)getUserName:(id<IMessageModel>)model;
/*
 *  红包点击回调
 *
 *  @param  消息model
 */
- (void)hongBaoButtonSelected:(id<IMessageModel>)model;
/*
 *  红包详情点击回调
 *
 *  @param  消息model
 */
- (void)hongBaoDetailSelected:(NSDictionary*)dic;
@end
@interface MY_TTLClubHongBaoCell : UITableViewCell<IModelChatCell>
{
    UIButton *_statusButton;
    UILabel *_hasRead;
    EaseBubbleView *_bubbleView;
    UIActivityIndicatorView *_activity;
    UILabel *_nameLabel;
    NSLayoutConstraint *_statusWidthConstraint;
}
/** @brief 会话标题 */
@property (strong, nonatomic) UILabel *VipLevelLabel;
@property (nonatomic, strong) UILabel * cityLable;     //城市
@property (nonatomic, strong) UIButton * hongbaoView;  //红包
@property (nonatomic, strong) LXDTextView * bottomLblView;  //
/*
 *  头像尺寸大小
 */
@property (nonatomic) CGFloat avatarSize UI_APPEARANCE_SELECTOR; //default 30;

/*
 *  头像圆角
 */
@property (nonatomic) CGFloat avatarCornerRadius UI_APPEARANCE_SELECTOR; //default 0;

/*
 *  昵称显示字体
 */
@property (nonatomic) UIFont *messageNameFont UI_APPEARANCE_SELECTOR; //default [UIFont systemFontOfSize:10];

/*
 *  昵称显示颜色
 */
@property (nonatomic) UIColor *messageNameColor UI_APPEARANCE_SELECTOR; //default [UIColor grayColor];

/*
 *  昵称显示高度
 */
@property (nonatomic) CGFloat messageNameHeight UI_APPEARANCE_SELECTOR; //default 15;
@property (nonatomic) CGFloat hongBaoHeight;
@property (nonatomic) CGFloat bottomLableHeight;


@property (weak, nonatomic) id<ClubHongBaoCellDelegate> delegate;

@property (nonatomic, strong) UIActivityIndicatorView *activity;

@property (strong, nonatomic) UIImageView *avatarView;

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) UIButton *statusButton;

@property (strong, nonatomic) UILabel *hasRead;
@property (nonatomic, strong) UIImageView * videoverifyImg;     //视频认证

/** @brief 气泡视图 */
@property (strong, nonatomic) EaseBubbleView *bubbleView;

@property (strong, nonatomic) id<IMessageModel> model;
//@property (strong, nonatomic) NSDictionary* modelDic;

/*
 *  状态按钮尺寸
 */
@property (nonatomic) CGFloat statusSize UI_APPEARANCE_SELECTOR; //default 20;

/*
 *  加载尺寸
 */
@property (nonatomic) CGFloat activitySize UI_APPEARANCE_SELECTOR; //default 20;
/*
 *  聊天气泡的最大宽度
 */
@property (nonatomic) CGFloat bubbleMaxWidth UI_APPEARANCE_SELECTOR; //default 200;

@property (nonatomic) UIEdgeInsets bubbleMargin UI_APPEARANCE_SELECTOR; //default UIEdgeInsetsMake(8, 0, 8, 0);

@property (nonatomic) UIEdgeInsets leftBubbleMargin UI_APPEARANCE_SELECTOR; //default UIEdgeInsetsMake(8, 15, 8, 10);

@property (nonatomic) UIEdgeInsets rightBubbleMargin UI_APPEARANCE_SELECTOR; //default UIEdgeInsetsMake(8, 10, 8, 15);
/*
 *  发送者气泡图片
 */
@property (strong, nonatomic) UIImage *sendBubbleBackgroundImage UI_APPEARANCE_SELECTOR;
/*
 *  接收者气泡图片
 */
@property (strong, nonatomic) UIImage *recvBubbleBackgroundImage UI_APPEARANCE_SELECTOR;
/*
 *  消息显示字体
 */
@property (nonatomic) UIFont *messageTextFont UI_APPEARANCE_SELECTOR; //default [UIFont systemFontOfSize:15];

/*
 *  消息显示颜色
 */
@property (nonatomic) UIColor *messageTextColor UI_APPEARANCE_SELECTOR; //default [UIColor blackColor];

@property (nonatomic,assign) BOOL  isHiddenBottomView;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model;
+ (instancetype)cellForTableView:(UITableView*)tableView withModel:(id<IMessageModel>)model;

@end


