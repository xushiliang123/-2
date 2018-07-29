//
//  MY_GLClubListTableViewCell.h
//  VTIME
//
//  Created by gll on 2017/10/21.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_GLClubModel.h"
@interface MY_GLClubListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *headerButton;
@property (weak, nonatomic) IBOutlet UILabel *clubNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *InfoClubLabel;

@property (strong, nonatomic) MY_GLClubModel * model;

@end
