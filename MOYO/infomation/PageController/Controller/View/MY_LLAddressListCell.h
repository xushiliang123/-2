//
//  MY_LLAddressListCell.h
//  VTIME
//
//  Created by Louie on 2017/9/11.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_LLAddressListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *VImg;
@property (weak, nonatomic) IBOutlet UIImageView *interdependenceImgV;
@property (weak, nonatomic) IBOutlet MY_LLSexConsumerView *sexView;
@property (weak, nonatomic) IBOutlet UIImageView *gztb;

//  头像点击
@property (nonatomic, copy) void(^headIconGestureBlock)(MY_LYPersonInfoModel * model);

@property (nonatomic, strong) MY_LYPersonInfoModel * model;

@end
