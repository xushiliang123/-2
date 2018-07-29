//
//  MY_LLchatViewHoneBaoCell.h
//  VTIME
//
//  Created by 听听 on 2017/11/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMessageModel.h"

#import "EaseBubbleView.h"

@protocol MY_LLchatViewHoneBaoCellDelegate <NSObject>

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


@interface MY_LLchatViewHoneBaoCell : UITableViewCell<IModelChatCell>
{
    UIButton *_statusButton;
    UILabel *_hasRead;
    EaseBubbleView *_bubbleView;
    UIActivityIndicatorView *_activity;
    UILabel *_nameLabel;
    NSLayoutConstraint *_statusWidthConstraint;
}
@property (nonatomic, strong) UIButton * hongbaoView;  //红包

/*
 *  头像尺寸大小
 */
@property (nonatomic) CGFloat avatarSize UI_APPEARANCE_SELECTOR; //default 30;

/*
 *  头像圆角
 */
@property (nonatomic) CGFloat avatarCornerRadius UI_APPEARANCE_SELECTOR; //default 0;



@property (nonatomic) CGFloat hongBaoHeight;


@property (weak, nonatomic) id<MY_LLchatViewHoneBaoCellDelegate> delegate;

@property (nonatomic, strong) UIActivityIndicatorView *activity;

@property (strong, nonatomic) UIImageView *avatarView;

@property (strong, nonatomic) UILabel *priceLabel;

@property (strong, nonatomic) UIButton *statusButton;

@property (strong, nonatomic) UILabel *hasRead;

/** @brief 气泡视图 */
@property (strong, nonatomic) EaseBubbleView *bubbleView;

@property (strong, nonatomic) id<IMessageModel> model;

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


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model;
+ (instancetype)cellForTableView:(UITableView*)tableView withModel:(id<IMessageModel>)model;

@end
