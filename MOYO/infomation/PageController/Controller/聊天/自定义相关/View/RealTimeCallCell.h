//
//  RealTimeCallCell.h
//  TogetherLu
//
//  Created by Louie on 2017/6/7.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RealTimeCallCell : UITableViewCell

@property (nonatomic, assign) BOOL isSend;                      //  是否是发送方

@property (nonatomic, strong) UIImageView * headIcon;           //  头像
@property (nonatomic, strong) UIImageView * bubbleImageView;    //  气泡
@property (nonatomic, strong) UIImageView * typeImageView;      //  类型图标
@property (nonatomic, strong) UILabel * contentLabel;           //  文字内容

@property (strong, nonatomic) id<IMessageModel> model;

@end
