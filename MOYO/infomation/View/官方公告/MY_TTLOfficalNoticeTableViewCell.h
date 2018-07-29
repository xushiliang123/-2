//
//  MY_TTLOfficalNoticeTableViewCell.h
//  TogetherLu
//
//  Created by MadridLee on 2017/1/4.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMessageModel.h"
@interface MY_TTLOfficalNoticeTableViewCell : UITableViewCell


@property (strong, nonatomic) UIView* viewBack;

@property (strong, nonatomic) UIImageView* imgvIcon;

@property (strong, nonatomic) UILabel* labelTitle;

@property (strong, nonatomic) UILabel* labelDetail;

@property (strong, nonatomic) UIButton* watchBtn;

@property (strong, nonatomic) UIImageView* leftImgv;

@property (strong, nonatomic) UIImageView* imgvHeader;

@property (strong, nonatomic) UIView* line1;

@property (strong, nonatomic) UIView* line2;

@property (assign, nonatomic) CGFloat height;

-(void)showData:(id<IMessageModel>)model;

@end
