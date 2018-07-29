//
//  MY_TTLPacketRecordTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_TTLPacketRecordModel.h"

@interface MY_TTLPacketRecordTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

-(void)showData:(MY_TTLPacketRecordModel *)model;

@end
