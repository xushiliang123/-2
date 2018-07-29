//
//  MY_TTLClubRedDetailTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/10/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubRedDetailTableViewCell.h"

@implementation MY_TTLClubRedDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.vipLabel.font = [UIFont boldSystemFontOfSize:9];
}

-(void)setModel:(MY_GLClubRedListModel *)model{
    
    _model = model;
    
    NSURL * imgUrl = [NSURL URLWithString:_model.headIcon];
    
    __weak typeof(self) weakSwlf = self;
    
    [self.iconImgv sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"aa"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        weakSwlf.iconImgv.image = [Utility circleImage:image borderWidth:0 borderColor:0];
    }];
    
	if (![Utility isBlankString:_model.nickName]) {
        self.nameLabel.text = _model.nickName;
    }
    
    self.namelabelWidth.constant = [Utility stringSizeWithString:self.nameLabel.text textSize:17 width:0 height:21].width + 4;
    
    self.timeLabel.text = [Utility onLineShowDateString:[_model.createTime integerValue]];
    
//    self.priceLabel.text = [_model.money stringValue];
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f元",[_model.money floatValue]];
    
    // vip等级
//    NSString * vipLevelStr = [NSString stringWithFormat:@"VIP%td",[_model.consumptionLevel integerValue]];
    NSString * vipLevelStr = GetVipLevel([_model.consumptionLevel integerValue]);
    self.vipLabel.text = vipLevelStr;
    
    CGSize levelSize = [vipLevelStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:9]} context:nil].size;
    
//    CGRect rect = self.vipLabel.frame;
//    rect.size.width = levelSize.width+20;
    self.vipLevelWidth.constant = levelSize.width+ 10;
    
    if ([_model.nobleLevel integerValue]) {//VIP
        
        self.nameLabel.textColor = GOLDCOLOR;
    }else{
        self.nameLabel.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
    }
    
    
    //如果有类型 则显示类型 如果没有 昵称在最下面
    //是否认证
    if (_model.isAuthen) {
        
        self.JIAVrenzen.hidden = NO;
    }else{
        
        self.JIAVrenzen.hidden = YES;

    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
