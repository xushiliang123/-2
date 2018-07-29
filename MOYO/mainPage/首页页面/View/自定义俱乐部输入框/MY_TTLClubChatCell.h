//
//  MY_TTLClubChatCell.h
//  VTIME
//
//  Created by 听听 on 2017/10/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BordViewBlock)(NSString *imgURl,NSString *uid);
extern NSString *const EaseMessageCellIdentifierSendText;
extern NSString *const EaseMessageCellIdentifierSendLocation;
extern NSString *const EaseMessageCellIdentifierSendVoice;
extern NSString *const EaseMessageCellIdentifierSendVideo;
extern NSString *const EaseMessageCellIdentifierSendImage;
extern NSString *const EaseMessageCellIdentifierSendFile;
@interface MY_TTLClubChatCell : EaseMessageCell
{
    UILabel *_nameLabel;
}
/** @brief vip标题 */
@property (strong, nonatomic) UILabel *VipLevelLabel;
@property (nonatomic, strong) UILabel * dateLable;     //日期
@property (nonatomic, strong) UILabel * cityLable;     //城市
@property (nonatomic, strong) UIImageView * videoverifyImg;     //视频认证
@property (nonatomic, strong) UIView * lineV;     //竖线
@property (nonatomic, strong) UIButton *bordImageView; //图片边框
//@property (nonatomic, copy) NSString * contentLabel;           //  文字内容
//@property (strong, nonatomic) id<IMessageModel> model;
/*
 *  头像尺寸大小
 */
@property (nonatomic) CGFloat avatarSize UI_APPEARANCE_SELECTOR; //default 30;
/*
 *  头像圆角
 */
//@property (nonatomic) CGFloat avatarCornerRadius UI_APPEARANCE_SELECTOR; //default 0;
/*
 *  昵称显示字体
 */
@property (nonatomic) UIFont *messageNameFont UI_APPEARANCE_SELECTOR; //default [UIFont systemFontOfSize:10];
/*
 *  昵称显示颜色
 */
@property (nonatomic) UIColor *messageNameColor UI_APPEARANCE_SELECTOR; //default [UIColor grayColor];


@property (nonatomic,copy) NSMutableAttributedString *textAttribute; //富文本文字
/*
 *  昵称显示高度
 */
@property (nonatomic) CGFloat messageNameHeight UI_APPEARANCE_SELECTOR; //default 15;
@property (nonatomic,copy) BordViewBlock bordViewClickBlock;
+ (instancetype)cellForTableView:(UITableView*)tableView withModel:(id<IMessageModel>)model;
@end
