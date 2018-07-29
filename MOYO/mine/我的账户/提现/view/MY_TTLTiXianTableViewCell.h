//
//  MY_TTLTiXianTableViewCell.h
//  TogetherLu
//
//  Created by MadridLee on 2017/4/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLTiXianTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cardLabel;

@property (weak, nonatomic) IBOutlet UIButton *bindBtn;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@property (weak, nonatomic) IBOutlet UILabel *tixianLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIView *viewLine;
@end
