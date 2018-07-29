//
//  MyInfoTableViewCell.m
//  TogetherLu
//
//  Created by Louie on 17/1/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MyInfoTableViewCell.h"

@implementation MyInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.rightImageView.layer.masksToBounds = YES;
    self.rightImageView.contentMode = UIViewContentModeScaleAspectFill;
}

/*
 int code; //1为点赞 2为评论 3为送礼
 String nickName; //  送礼(点赞)人的昵称
 String headIcon;  // 送礼或点赞人的头像
 String img; //动态图片
 String comment; // 2评论内容
 int num;//个数
 String giftUnits; //送礼单位
 String giftUrl;//礼物图片
 long time; //动作发生时间
 */

- (void)setModel:(VideoResolutionModel *)model{
    _model = model;
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
    
    self.nameLabel.text = model.nickName;
    
    
    if(model.msgType.integerValue == 0)
    {
        self.praiseImage.hidden = NO;
        self.describeLabel.hidden = YES;
        self.describeLabel.text = nil;
    }
    else
    {
        [self.praiseImage setHidden:YES];
        [self.describeLabel setHidden:NO];
        self.describeLabel.textColor = GOLDCOLOR;
        self.describeLabel.font = [UIFont systemFontOfSize:15];
        self.describeLabel.text = [NSString stringWithFormat:@"￥%@",model.encourageMoney];
    }
    
    self.timeLabel.text = [self updateTimeForCreaetTime:model.createTime.integerValue];
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
}

-(void)setXtmodel:(MY_XTRrpModel *)xtmodel
{
    _xtmodel = xtmodel;
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_xtmodel.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
    
    self.nameLabel.text = _xtmodel.nickName;
    
    [self.praiseImage setHidden:YES];
    [self.describeLabel setHidden:NO];
    self.describeLabel.textColor = GOLDCOLOR;
    self.describeLabel.font = [UIFont systemFontOfSize:15];
    self.describeLabel.text = [NSString stringWithFormat:@"￥%@",_xtmodel.encourageMoney];
    self.timeLabel.text = [self updateTimeForCreaetTime:xtmodel.createTime.integerValue];
    
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:_xtmodel.img] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
}

- (NSString *)updateTimeForCreaetTime:(NSInteger)ctime {
    // 获取当前时时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    // 创建歌曲时间戳(后台返回的时间 一般是13位数字)
    NSTimeInterval createTime = ctime/1000;
    // 时间差
    NSTimeInterval time = currentTime - createTime;
    
    // 秒转小时
    NSInteger sec = time/1;
    if (sec<60) {
        return [NSString stringWithFormat:@"%ld秒前",sec];
    }
    
    // 秒转小时
    NSInteger min = time/60;
    if (min<60) {
        return [NSString stringWithFormat:@"%ld分钟前",min];
    }
    
    // 秒转小时
    NSInteger hours = time/3600;
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒转天数
    NSInteger days = time/3600/24;
    if (days < 30) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
    //秒转月
    NSInteger months = time/3600/24/30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
    //秒转年
    NSInteger years = time/3600/24/30/12;
    return [NSString stringWithFormat:@"%ld年前",years];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
