//
//  MY_TTLClubRedHeadTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/10/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MY_GLClubRedInfoModel.h"

@interface MY_TTLClubRedHeadTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgv;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) MY_GLClubRedInfoModel *model;


@end
