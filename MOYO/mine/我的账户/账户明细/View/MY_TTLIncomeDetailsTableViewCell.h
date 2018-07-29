//
//  MY_TTLIncomeDetailsTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_TTLIncomeModel.h"
@interface MY_TTLIncomeDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;


-(void)showDetail:(MY_TTLIncomeModel *)model;

@end
