//
//  MY_TTLSystemTImeTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/8/30.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_LYSystemTImeTableViewCell.h"

@implementation MY_LYSystemTImeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.labelTime = [[UILabel alloc]init];
        self.labelTime.font = [UIFont systemFontOfSize:11];
        self.labelTime.textColor = [Utility colorWithHexString:@"999999" alpha:1];
        self.labelTime.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.labelTime];
        [self.labelTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.height.mas_equalTo(15);
        }];
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
