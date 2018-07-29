//
//  FindVideoDetailsCell.m
//  TogetherLu
//
//  Created by Louie on 2017/6/18.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "FindVideoDetailsCell.h"
#import <AVFoundation/AVFoundation.h>


@implementation FindVideoDetailsCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUI];
    }
    return self;
}


- (void)setUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.contentView.backgroundColor = [UIColor whiteColor];
//    
//    CGFloat height;
//    if (self.videoWidth > self.videoHeight) {
//        height = self.videoHeight * SCREEN_WIDTH / self.videoWidth;
//    }
//    else {
//        height = SCREEN_WIDTH;
//    }
/*
    //  头部视图
    _headView = [[UIView alloc] init];
    _headView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = self.headView;
    
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(height + 10 + 12 + 15 + 45 + 10 + 14 + 15);
    }];
*/
    
//  展示图
    self.headView = [[UIImageView alloc] init];
    self.headView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.headView];
    
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
//        make.width.mas_equalTo(SCREEN_WIDTH);
//        make.height.mas_equalTo(height);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_WIDTH);
    }];
    
// 设置imageView的tag，在PlayerView中取（建议设置100以上）
    self.headView.tag = 101;
    
//  地址&时间
    self.regionLabel = [[UILabel alloc] init];
    self.regionLabel.textAlignment = NSTextAlignmentLeft;
    self.regionLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.regionLabel];
    
    [self.regionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.headView.mas_bottom).mas_offset(9);
        make.left.equalTo(_headView.mas_left).mas_offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH / 2);
        make.height.mas_equalTo(14);
    }];
    
//  作品数
    self.worksNumberLabel = [[UILabel alloc] init];
    self.worksNumberLabel.textAlignment = NSTextAlignmentRight;
    self.worksNumberLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.worksNumberLabel];
    
    [self.worksNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.regionLabel.mas_bottom);
        make.right.equalTo(_headView.mas_right).mas_offset(-10);
        make.width.mas_equalTo(SCREEN_WIDTH / 2);
        make.height.mas_equalTo(14);
    }];
    
//  头像
    self.avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.avatarBtn.layer.masksToBounds = YES;
    self.avatarBtn.layer.cornerRadius = 3;
    [self.contentView addSubview:self.avatarBtn];
    
    [self.avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.regionLabel.mas_bottom).mas_offset(14);
        make.left.equalTo(self.headView.mas_left).mas_offset(10);
        make.width.height.mas_equalTo(45);
    }];
    
//  昵称
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.avatarBtn.mas_top).mas_offset(2);
        make.left.equalTo(self.avatarBtn.mas_right).mas_offset(10);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(16);
    }];
    
    //  关注按钮
    self.attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.attentionBtn.layer.masksToBounds = YES;
    self.attentionBtn.layer.cornerRadius = 3.0;
    self.attentionBtn.layer.borderWidth = 0.5;
    self.attentionBtn.layer.borderColor = GOLDCOLOR.CGColor;
    self.attentionBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    [self.attentionBtn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
    [self.contentView addSubview:self.attentionBtn];
    
    [self.attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.avatarBtn.mas_centerY);
        make.right.equalTo(_headView.mas_right).mas_offset(-10);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(25);
    }];
    
//  动态文字
    self.dynamicLabel = [[UILabel alloc] init];
    self.dynamicLabel.numberOfLines = 0;
    self.dynamicLabel.textAlignment = NSTextAlignmentLeft;
    self.dynamicLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.dynamicLabel];
    
    [self.dynamicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-14);
        make.left.equalTo(self.contentView.mas_left).mas_offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH - 20);
        make.height.mas_equalTo(14);
    }];
    
//  播放按钮
    // 代码添加playerBtn到imageView上
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    self.playBtn.backgroundColor = [UIColor purpleColor];
    [self.playBtn setImage:[UIImage imageNamed:@"videoPlayBtn"] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.playBtn];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.headView);
        make.width.height.mas_equalTo(ScaleWidth(50));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
