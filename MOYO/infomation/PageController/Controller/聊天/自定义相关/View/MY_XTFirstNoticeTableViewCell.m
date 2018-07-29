//
//  MY_XTFirstNoticeTableViewCell.m
//  VTIME
//
//  Created by tingting on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTFirstNoticeTableViewCell.h"

@implementation MY_XTFirstNoticeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.NoticeLabel.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
    self.TagInfoLabel1.textColor = [Utility colorWithHexString:@"#c9c9c9" alpha:1.0f];
    self.TagInfoLabel2.textColor = [Utility colorWithHexString:@"#c9c9c9" alpha:1.0f];
    self.TagInfoLabel3.textColor = [Utility colorWithHexString:@"#c9c9c9" alpha:1.0f];
    self.TagInfoLabel4.textColor = [Utility colorWithHexString:@"#c9c9c9" alpha:1.0f];
    self.TagInfoLabel5.textColor = [Utility colorWithHexString:@"#c9c9c9" alpha:1.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
