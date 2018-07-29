//
//  MY_LLRedPacketCell.h
//  VTIME
//
//  Created by Louie on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_LLRedPacketCell : UITableViewCell

@property (nonatomic, strong) UIImageView * headIcon;           //  头像
@property (nonatomic, strong) UIImageView * bubbleImgeV;
@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) UIButton * affirmBtn;


@property (nonatomic, copy) void(^btnClickBlock)(BOOL isCancel);

- (void)setMessageData:(id<IMessageModel>)model withUserId:(NSString *)userId;

@end
