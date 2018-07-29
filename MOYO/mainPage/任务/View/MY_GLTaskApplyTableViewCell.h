//
//  MY_GLTaskApplyTableViewCell.h
//  VTIME
//
//  Created by gll on 2017/12/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_LYTaskApplyModel.h"

@interface MY_GLTaskApplyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *descributionInfo;
@property (strong, nonatomic) MY_LYTaskApplyModel * model;
@property (weak, nonatomic) IBOutlet UIButton *statusBtn;
@property(copy)void(^taskApplyBlock)(MY_GLTaskApplyTableViewCell * taskApplyCell);
@end
