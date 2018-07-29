//
//  MY_TTLSkillCenterTableViewCell.h
//  TogetherLu
//
//  Created by MadridLee on 2017/8/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_TTLTitleView.h"
#import "MY_TTLMeModel.h"
@interface MY_TTLSkillCenterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet MY_TTLTitleView *leftTitle;
@property (weak, nonatomic) IBOutlet MY_TTLTitleView *rightView;



-(void) showDetail:(MY_TTLMeModel *)model;
@end
