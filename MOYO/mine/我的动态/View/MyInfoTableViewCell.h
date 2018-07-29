//
//  MyInfoTableViewCell.h
//  TogetherLu
//
//  Created by Louie on 17/1/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VideoResolutionModel.h"
#import "MY_XTRrpModel.h"

@interface MyInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *describeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@property (nonatomic, strong) VideoResolutionModel * model;
@property (nonatomic, strong) MY_XTRrpModel * xtmodel;
@property (weak, nonatomic) IBOutlet UIImageView *praiseImage;

@end
