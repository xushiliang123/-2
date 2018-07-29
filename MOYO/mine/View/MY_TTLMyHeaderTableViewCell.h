//
//  MY_TTLMyHeaderTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/9/11.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_TTLMeModel.h"
#import "MY_LLSexConsumerView.h"
@interface MY_TTLMyHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *videoBtn;
@property (weak, nonatomic) IBOutlet UIImageView *vHead;
@property (weak, nonatomic) IBOutlet UILabel *vipLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *addVLabel;
@property (weak, nonatomic) IBOutlet UIButton *selfIngoBtn;
@property (weak, nonatomic) IBOutlet UILabel *nobeLabel;
@property (weak, nonatomic) IBOutlet UILabel *secretLabel;

-(void)showData:(MY_TTLMeModel *)model;

@end
