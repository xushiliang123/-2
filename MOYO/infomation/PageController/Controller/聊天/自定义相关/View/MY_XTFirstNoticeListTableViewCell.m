//
//  MY_XTFirstNoticeListTableViewCell.m
//  VTIME
//
//  Created by tingting on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTFirstNoticeListTableViewCell.h"

@implementation MY_XTFirstNoticeListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.TagLabel.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
    self.yuanyin.textColor = [Utility colorWithHexString:@"#999999" alpha:1.0f];
    self.InfoLabel.textColor = [Utility colorWithHexString:@"#999999" alpha:1.0f];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
