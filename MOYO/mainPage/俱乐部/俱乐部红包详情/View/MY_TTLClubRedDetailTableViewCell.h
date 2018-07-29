//
//  MY_TTLClubRedDetailTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/10/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_GLClubRedInfoModel.h"

@interface MY_TTLClubRedDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgv;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *vipLabel;
@property (strong, nonatomic) MY_GLClubRedListModel *model;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *namelabelWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vipLevelWidth;
@property (weak, nonatomic) IBOutlet UIImageView *JIAVrenzen;

@end
