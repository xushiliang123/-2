//
//  MY_TTLClubNoticeTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLClubNoticeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgv;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clubLabel;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UIButton *disagreeBtn;

@end
