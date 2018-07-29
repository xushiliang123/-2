//
//  MY_TTLTitleSwitchTableViewCell.h
//  TogetherLu
//
//  Created by MadridLee on 2016/12/29.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLTitleSwitchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTrans;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UISwitch *switchIm;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *switchTrans;

@end
